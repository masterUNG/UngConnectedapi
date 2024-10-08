import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ungconnectedapi/models/user_model.dart';
import 'package:ungconnectedapi/states/main_home.dart';
import 'package:ungconnectedapi/utility/app_constant.dart';
import 'package:ungconnectedapi/utility/app_controller.dart';

import 'package:dio/dio.dart' as dio;

class AppService {
  AppController appController = Get.put(AppController());

  Future<void> processSignInWithFacebook() async {

    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential oAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    await FirebaseAuth.instance.signInWithCredential(oAuthCredential).then(
      (value) {
        Get.snackbar('Login Facebook', 'Welcome Login Success');
      
      },
    );
  }

  Future<void> checkLogin({
    required String user,
    required String password,
  }) async {
    String urlApi =
        'https://www.androidthai.in.th/fluttertraining/ungConnected/getUserWhereUser.php?isAdd=true&user=$user';

    await dio.Dio().get(urlApi).then(
      (value) {
        if (value.toString() == 'null') {
          Get.snackbar('User False', 'No $user in my Database');
        } else {
          for (var element in json.decode(value.data)) {
            UserModel model = UserModel.fromMap(element);

            if (password == model.password) {
              //password True
              Get.offAll(MainHome(
                userModel: model,
              ));
              Get.snackbar('Authen Success', 'Welcome to My App');
            } else {
              Get.snackbar('Password False', 'Please Try Again Password False',
                  snackPosition: SnackPosition.BOTTOM);
            }
          }
        }
      },
    );
  }

  Future<void> processRegister({
    required String name,
    required String user,
    required String password,
  }) async {
    //Check User
    String urlCheckUser =
        'https://www.androidthai.in.th/fluttertraining/ungConnected/getUserWhereUser.php?isAdd=true&user=$user';

    await dio.Dio().get(urlCheckUser).then(
      (value) async {
        print('## value ---> $value');

        if (value.toString() == 'null') {
          // User True ===> Upload Image To Server

          String urlUpload =
              'https://www.androidthai.in.th/fluttertraining/ungConnected/saveFile.php';
          String nameFile = '$user.jpg';

          Map<String, dynamic> map = {};
          map['file'] = await dio.MultipartFile.fromFile(
              appController.files.last.path,
              filename: nameFile);
          dio.FormData formData = dio.FormData.fromMap(map);
          await dio.Dio().post(urlUpload, data: formData).then(
            (value) async {
              //Insert New Data

              String urlAvatar =
                  'https://www.androidthai.in.th/fluttertraining/ungConnected/upload/$nameFile';
              print('## urlAvatar ====> $urlAvatar');

              String urlApiInsert =
                  'https://www.androidthai.in.th/fluttertraining/ungConnected/insertData.php?isAdd=true&name=$name&user=$user&password=$password&avatar=$urlAvatar';

              await dio.Dio().get(urlApiInsert).then(
                (value) {
                  Get.back();
                  Get.snackbar('Register Success', 'Please Login',
                      backgroundColor: AppConstant.mainColor,
                      colorText: GFColors.WHITE);
                },
              );
            },
          );
        } else {
          Get.snackbar('User False', 'เปลี่ยน User ใหม่ $user มีคนใช้ไปแล้ว',
              backgroundColor: GFColors.DANGER, colorText: GFColors.WHITE);
        }
      },
    );
  }

  Future<void> processGetImage({required ImageSource source}) async {
    var result = await ImagePicker()
        .pickImage(source: source, maxWidth: 800, maxHeight: 800);

    if (result != null) {
      File file = File(result.path);

      appController.files.add(file);
    }
  }
}
