import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungconnectedapi/firebase_options.dart';
import 'package:ungconnectedapi/states/authen.dart';
import 'package:ungconnectedapi/utility/app_constant.dart';
import 'package:ungconnectedapi/utility/app_http_override.dart';

Future<void> main() async {
  HttpOverrides.global = AppHttpOverride();

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (value) {
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Authen(),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppConstant.mainColor)),
    );
  }
}
