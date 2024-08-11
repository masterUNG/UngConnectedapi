import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungconnectedapi/states/authen.dart';
import 'package:ungconnectedapi/utility/app_constant.dart';

void main() {
  runApp(MyApp());
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
