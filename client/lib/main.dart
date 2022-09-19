import 'package:client/bindings/main_screen_binding.dart';
import 'package:client/bindings/wallet_binding.dart';
import 'package:client/bindings/welcome_binding.dart';
import 'package:client/routes.dart';
import 'package:client/themes/app_themes.dart';
import 'package:client/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // setting up camera managery
  // final cameras = await availableCameras();

  // await loadServices();

  // Get specific camera from the list of available cameras
  // final firstCamera = cameras.first;

  loadDependencies();
  await GetStorage.init();
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]); // auto rotate off
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
}

// Future<void> loadServices() async {}

void loadDependencies() {
  WelcomeBinding().dependencies();
  WalletBinding().dependencies();
  MainScreenBinding().dependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
