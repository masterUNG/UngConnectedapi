// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:ungconnectedapi/states/create_new_account.dart';
import 'package:ungconnectedapi/widgets/widget_button.dart';

import 'package:ungconnectedapi/widgets/widget_form.dart';
import 'package:ungconnectedapi/widgets/widget_image.dart';

class Authen extends StatelessWidget {
  const Authen({super.key});

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
                child: Column(
                  children: [
                    const SizedBox(height: 64),
                    const WidgetImage(),
                    const SizedBox(height: 16),
                    const WidgetForm(
                      hintText: 'User :',
                    ),
                    const SizedBox(height: 16),
                    const WidgetForm(
                      hintText: 'Password :',
                    ),
                    const SizedBox(height: 8),
                    WidgetButton(
                      onPressed: () {},
                      text: 'Login',
                      fullWidthButton: true,
                    ),
                    WidgetButton(
                      text: 'Create New Account',
                      onPressed: () {
                        Get.to(CreateNewAccount());
                      },
                      type: GFButtonType.transparent,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
