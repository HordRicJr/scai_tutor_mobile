class Message {
  final String text;
  final bool isBot;
  final String? imagePath; // Local path for displaying the image in the UI
  final String? imageBase64; // Base64 for sending to API (if applicable)

  Message({
    required this.text,
    this.isBot = false,
    this.imagePath,
    this.imageBase64,
  });

  Map<String, dynamic> toJson() {
    return {'text': text, 'isBot': isBot, 'imageBase64': imageBase64};
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      text: json['text'],
      isBot: json['isBot'] ?? false,
      imageBase64: json['imageBase64'],
    );
  }
}
