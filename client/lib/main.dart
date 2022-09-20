import 'package:camera/camera.dart';
import 'package:client/bindings/main_screen_binding.dart';
import 'package:client/bindings/nft_binding.dart';
import 'package:client/bindings/wallet_binding.dart';
import 'package:client/bindings/welcome_binding.dart';
import 'package:client/routes.dart';
import 'package:client/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  loadDependencies();
  // await loadServices();
  await GetStorage.init();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    debugPrint('Error in fetching the cameras: $e');
  }
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]); // auto rotate off
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
}

void loadDependencies() {
  WelcomeBinding().dependencies();
  WalletBinding().dependencies();
  MainScreenBinding().dependencies();
  NFTBinding().dependencies();
}

// Future<void> loadServices() async {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'exibit',
      initialRoute: "/",
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      themeMode: ThemeMode.dark,
      theme: AppThemes.darkTheme,
    );
  }
}
