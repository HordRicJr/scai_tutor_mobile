import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:http/http.dart' as http;

import 'package:scai_tutor_mobile/app/data/models/Message.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ScsAIBotController extends GetxController {
  RxList<Message> messages = <Message>[].obs;
  TextEditingController textController = TextEditingController();
  Rx<File?> selectedImage = Rx<File?>(null); // Make reactive for UI updates
  final ImagePicker picker = ImagePicker();
  final SpeechToText speech = SpeechToText();
  RxBool speechInitialized = false.obs;
  RxBool isListening = false.obs;

  // Hugging Face API credentials
  static final String? _hfToken =
      dotenv.env['HF_TOKEN']; // Replace with your token
  static const String _endpointUrl =
      'https://ep2bfae1nmeegvaq.us-east-1.aws.endpoints.huggingface.cloud';

  @override
  void onInit() {
    super.onInit();
    _initSpeech();
  }

  Future<void> _initSpeech() async {
    try {
      speechInitialized.value = await speech.initialize(
        onStatus: (status) => print('Speech status: $status'),
        onError: (error) {
          print('Speech error: $error');
          Get.snackbar(
            'Erreur',
            'Échec de l\'initialisation de la reconnaissance vocale.',
          );
        },
      );
    } catch (e) {
      print('Speech initialization failed: $e');
      Get.snackbar(
        'Erreur',
        'Impossible d\'initialiser la reconnaissance vocale.',
      );
    }
    update();
  }

  Future<void> startListening() async {
    if (!speechInitialized.value || isListening.value) return;
    var status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      Get.snackbar('Erreur', 'Permission de microphone refusée.');
      return;
    }

    isListening.value = true;
    try {
      await speech.listen(
        onResult: (SpeechRecognitionResult result) {
          textController.text = result.recognizedWords;
          update();
        },
        listenFor: const Duration(seconds: 30),
        pauseFor: const Duration(seconds: 5),
        localeId: 'fr_FR',
      );
    } catch (e) {
      Get.snackbar('Erreur', 'Échec de la reconnaissance vocale : $e');
    } finally {
      isListening.value = false;
      update();
    }
  }

  Future<void> stopListening() async {
    if (isListening.value) {
      await speech.stop();
      isListening.value = false;
      update();
    }
  }

  Future<void> pickImage(ImageSource source) async {
    PermissionStatus status;
    if (source == ImageSource.camera) {
      status = await Permission.camera.request();
    } else {
      status = await Permission.photos.request();
    }

    if (status != PermissionStatus.granted) {
      Get.snackbar(
        'Erreur',
        'Permission refusée pour ${source == ImageSource.camera ? "la caméra" : "la galerie"}.',
      );
      return;
    }

    try {
      final XFile? picked = await picker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );
      if (picked != null) {
        selectedImage.value = File(picked.path); // Update reactive variable
      }
    } catch (e) {
      Get.snackbar('Erreur', 'Échec de la sélection d\'image : $e');
      print('Image picker error: $e');
    }
  }

  void clearImage() {
    selectedImage.value = null; // Clear the selected image
  }

  Future<void> sendMessage() async {
    final String text = textController.text.trim();
    if (text.isEmpty && selectedImage.value == null) return;

    String? imageBase64;
    String? imagePath;
    if (selectedImage.value != null) {
      try {
        final bytes = await selectedImage.value!.readAsBytes();
        imageBase64 = base64Encode(bytes);
        imagePath = selectedImage.value!.path;
      } catch (e) {
        Get.snackbar('Erreur', 'Impossible de lire l\'image : $e');
        return;
      }
    }

    messages.add(
      Message(
        text: text,
        isBot: false,
        imagePath: imagePath,
        imageBase64: imageBase64,
      ),
    );

    textController.clear();
    selectedImage.value = null;
    update();

    final Map<String, dynamic> payload = _buildHfPayload(text, imageBase64);

    try {
      final String response = await _callHfApi(payload);
      messages.add(Message(text: response, isBot: true));
    } catch (e) {
      messages.add(Message(text: 'Erreur API : $e', isBot: true));
    }
  }

  Map<String, dynamic> _buildHfPayload(String userText, String? imageBase64) {
    final Object inputs = imageBase64 != null
        ? {"text": userText, "image": imageBase64}
        : userText;

    return {
      "inputs": inputs,
      "parameters": {"temperature": 0.7},
    };
  }

  Future<String> _callHfApi(Map<String, dynamic> payload) async {
    print('Calling HF API with payload: ${jsonEncode(payload)}');
    final uri = Uri.parse(_endpointUrl);

    final response = await http.post(
      uri,
      headers: {
        'Authorization': 'Bearer $_hfToken',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(payload),
    );
    print('HF API response: ${response.statusCode} - ${response.body}');

    if (response.statusCode != 200) {
      throw Exception('HTTP ${response.statusCode} – ${response.body}');
    }

    final jsonBody = jsonDecode(response.body);
    if (jsonBody is List &&
        jsonBody.isNotEmpty &&
        jsonBody[0]['generated_text'] != null) {
      String generatedText = jsonBody[0]['generated_text'] as String;
      generatedText = generatedText
          .trim()
          .replaceAll('\r\n', '\n')
          .replaceAll('\r', '\n');
      return generatedText;
    }

    throw Exception('Unexpected response format: ${response.body}');
  }

  @override
  void onClose() {
    textController.dispose();
    speech.stop();
    super.onClose();
  }
}
