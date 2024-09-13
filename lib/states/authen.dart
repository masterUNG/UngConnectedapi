// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:ungconnectedapi/states/create_new_account.dart';
import 'package:ungconnectedapi/utility/app_service.dart';
import 'package:ungconnectedapi/widgets/widget_button.dart';

import 'package:ungconnectedapi/widgets/widget_form.dart';
import 'package:ungconnectedapi/widgets/widget_image.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  final keyForm = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                child: Form(
                  key: keyForm,
                  child: Column(
                    children: [
                      const SizedBox(height: 64),
                      const WidgetImage(),
                      const SizedBox(height: 16),
                      WidgetForm(
                        validator: (p0) {
                          if (p0?.isEmpty ?? true) {
                            return 'Please Fill User';
                          } else {
                            return null;
                          }
                        },
                        controller: userController,
                        hintText: 'User :',
                      ),
                      const SizedBox(height: 16),
                      WidgetForm(
                        validator: (p0) {
                          if (p0?.isEmpty ?? true) {
                            return 'Please Fill Password';
                          } else {
                            return null;
                          }
                        },
                        controller: passwordController,
                        hintText: 'Password :',
                      ),
                      const SizedBox(height: 8),
                      WidgetButton(
                        onPressed: () {
                          if (keyForm.currentState!.validate()) {
                            AppService().checkLogin(
                                user: userController.text,
                                password: passwordController.text);
                          }
                        },
                        text: 'Login',
                        fullWidthButton: true,
                      ),
                      WidgetButton(
                        text: 'Create New Account',
                        onPressed: () {
                          Get.to(const CreateNewAccount());
                        },
                        type: GFButtonType.transparent,
                      ),
                      GFIconButton(
                        icon: const Icon(Icons.facebook),
                        type: GFButtonType.transparent,
                        onPressed: () async {
                          AppService().processSignInWithFacebook();
                        },
                        size: GFSize.LARGE,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
