import 'package:client/views/welcome/welcome_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = [
    GetPage(
        name: '/',
        page: () => const WelcomePage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
  ];
}
