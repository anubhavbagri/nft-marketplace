import 'package:client/routes.dart';
import 'package:client/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await loadServices();
  loadDependencies();
  await GetStorage.init();
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]); // auto rotate off
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //   ),
  // );
}

// Future<void> loadServices() async {}

void loadDependencies() {}

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
