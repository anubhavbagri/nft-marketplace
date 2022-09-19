import 'package:client/views/camera/camera_screen.dart';

import 'package:client/views/main/discover_page.dart';
import 'package:client/views/main/main_screen.dart';
import 'package:client/views/wallet/wallet_page.dart';
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
    GetPage(
        name: '/wallet',
        page: () => const WalletPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: '/discover',
        page: () => const DiscoverPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: '/main-screen',
        page: () => MainScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: '/camera-screen',
        page: () => CameraScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
  ];
}
