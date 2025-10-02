import 'package:get/get.dart';

import 'sc_ai_bot_controller.dart';

class ScsAIBotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScsAIBotController>(() => ScsAIBotController());
  }
}
