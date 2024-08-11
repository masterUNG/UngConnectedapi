// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:ungconnectedapi/widgets/widget_button.dart';
import 'package:ungconnectedapi/widgets/widget_form.dart';
import 'package:ungconnectedapi/widgets/widget_icon_button.dart';

import 'package:ungconnectedapi/widgets/widget_image.dart';

class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({super.key});

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(height: 16),
          displayAvatar(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                child: Form(
                  key: keyForm,
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      WidgetForm(
                        labelText: 'Name :',
                        validator: (p0) {
                          if (p0?.isEmpty ?? true) {
                            return 'Please Fill Name';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      WidgetForm(
                        labelText: 'User :',
                        validator: (p0) {
                          if (p0?.isEmpty ?? true) {
                            return 'Please Fill User';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      WidgetForm(
                        labelText: 'Password :',
                        validator: (p0) {
                          if (p0?.isEmpty ?? true) {
                            return 'Please Fill Name';
                          } else if (p0!.length < 6) {
                            return 'Password ต้องมีมากกว่า 6 อักษร';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 8),
                      WidgetButton(
                        text: 'Create New Account',
                        onPressed: () {
                          if (keyForm.currentState!.validate()) {}
                        },
                        fullWidthButton: true,
                      ),
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

  Row displayAvatar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          height: 250,
          child: Stack(
            children: [
              const WidgetImage(path: 'images/avatar.png'),
              Positioned(
                bottom: 0,
                right: 0,
                child: WidgetIconButton(
                  icon: const Icon(Icons.photo_camera),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
