import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xaxino/data/services/push_notification_service.dart';
import 'package:xaxino/environment.dart';
import 'package:xaxino/firebase_options.dart';
import 'package:get/get.dart';
import 'package:xaxino/core/route/route.dart';
import 'package:xaxino/core/utils/messages.dart';
import 'package:xaxino/data/controller/localization/localization_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'core/di_service/di_services.dart' as di_service;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.camera.request();
  await Permission.microphone.request();
  await Permission.photos.request();
  Map<String, Map<String, String>> languages = await di_service.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform, name: Environment.appName);
  await PushNotificationService(apiClient: Get.find()).setupInteractedMessage();
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp(languages: languages));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatefulWidget {
  final Map<String, Map<String, String>> languages;
  const MyApp({Key? key, required this.languages}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
      builder: (localizeController) => GetMaterialApp(
        title: Environment.appName,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.noTransition,
        transitionDuration: const Duration(milliseconds: 200),
        initialRoute: RouteHelper.splashScreen,
        navigatorKey: Get.key,
        getPages: RouteHelper().routes,
        locale: localizeController.locale,
        translations: Messages(languages: widget.languages),
        fallbackLocale: Locale(localizeController.locale.languageCode, localizeController.locale.countryCode),
      ),
    );
  }
}
