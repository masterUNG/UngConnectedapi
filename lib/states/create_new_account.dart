// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:ungconnectedapi/widgets/widget_button.dart';
import 'package:ungconnectedapi/widgets/widget_form.dart';
import 'package:ungconnectedapi/widgets/widget_icon_button.dart';

import 'package:ungconnectedapi/widgets/widget_image.dart';

class CreateNewAccount extends StatelessWidget {
  const CreateNewAccount({super.key});

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
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    WidgetForm(labelText: 'Name :',),
                    SizedBox(height: 16),
                    WidgetForm(labelText: 'User :',),
                    SizedBox(height: 16),
                    WidgetForm(labelText: 'Password :',),
                    SizedBox(height: 8),
                    WidgetButton(
                      text: 'Create New Account',
                      onPressed: () {},
                      fullWidthButton: true,
                    ),
                  ],
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
