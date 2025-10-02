import 'package:get/get.dart';

import '../modules/ScAI_bot/sc_ai_bot_binding.dart';
import '../modules/ScAI_bot/sc_ai_bot_view.dart';
import '../modules/class_student/class_student_binding.dart';
import '../modules/class_student/class_student_view.dart';
import '../modules/class_student_details/class_student_details_binding.dart';
import '../modules/class_student_details/class_student_details_view.dart';
import '../modules/dashboard_student/dashboard_student_binding.dart';
import '../modules/dashboard_student/dashboard_student_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/landing/landing_binding.dart';
import '../modules/landing/landing_view.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';
import '../modules/profile/profile_binding.dart';
import '../modules/profile/profile_view.dart';
import '../modules/ressources_student/ressources_student_binding.dart';
import '../modules/ressources_student/ressources_student_view.dart';
import '../modules/signup/signup_binding.dart';
import '../modules/signup/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LANDING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LANDING,
      page: () => const LandingView(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD_STUDENT,
      page: () => DashboardStudentView(),
      binding: DashboardStudentBinding(),
    ),
    GetPage(
      name: _Paths.CLASS_STUDENT,
      page: () => ClassStudentView(),
      binding: ClassStudentBinding(),
    ),
    GetPage(
      name: _Paths.RESSOURCES_STUDENT,
      page: () => const RessourcesStudentView(),
      binding: RessourcesStudentBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SC_AI_BOT,
      page: () => const ScsAIBotView(),
      binding: ScsAIBotBinding(),
    ),
    GetPage(
      name: _Paths.CLASS_STUDENT_DETAILS,
      page: () => const ClassStudentDetailsView(),
      binding: ClassStudentDetailsBinding(),
    ),
  ];
}
