import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup_controller.dart';
import 'package:scai_tutor_mobile/app/theme/theme_colors.dart';

class TimeOnScreenView extends GetView<SignupController> {
  TimeOnScreenView({super.key});

  final List<String> timeOptions = [
    '5 - 10 min',
    '10 - 20 min',
    'Plus de 20 min',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    // Header (logo et titre)
                    _buildHeader(),

                    // Section avec fond d'écran
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/login_background.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: _buildContent(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Container(
            height: 45,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset('assets/images/app_logo.png'),
          ),
          const SizedBox(height: 10),
          const Text(
            'Créer un compte',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Combien de temps pourriez vous consacrer par jour pour vos apprentissages ?',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),

        // Boutons de temps
        Obx(
          () => Column(
            children: timeOptions.map((time) {
              return _buildTimeButton(
                time: time,
                isSelected: controller.selectedTime.value == time,
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 30),

        // Bouton Créer un compte
        ElevatedButton(
          onPressed: () {
            if (controller.selectedTime.value.isNotEmpty) {
              // Action de création de compte
              Get.toNamed("/dashboard-student");
            } else {
              Get.snackbar(
                'Sélection requise',
                'Veuillez sélectionner un temps',
              );
            }
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: SC_ThemeColors.darkBlue,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Créer un compte',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeButton({required String time, required bool isSelected}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: OutlinedButton(
        onPressed: () => controller.selectTime(time),
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected
              ? SC_ThemeColors.normalGreen
              : SC_ThemeColors.lightGrey,
          side: BorderSide(style: BorderStyle.none),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),

          padding: const EdgeInsets.symmetric(vertical: 20),
          minimumSize: const Size(double.infinity, 60),
        ),
        child: Text(
          time,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.white : SC_ThemeColors.darkBlue,
          ),
        ),
      ),
    );
  }
}
