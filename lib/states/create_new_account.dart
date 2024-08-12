// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ungconnectedapi/utility/app_controller.dart';
import 'package:ungconnectedapi/utility/app_dialog.dart';
import 'package:ungconnectedapi/utility/app_service.dart';
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

  AppController controller = Get.put(AppController());

  TextEditingController nameController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          displayAvatar(),
          GetX<AppController>(
            init: AppController(),
            initState: (_) {},
            builder: (AppController appController) {
              return appController.display.value
                  ? appController.files.isEmpty
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Please Take Photo',
                              style: TextStyle(color: GFColors.DANGER),
                            ),
                          ],
                        )
                      : const SizedBox()
                  : const SizedBox();
            },
          ),
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
                        controller: nameController,
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
                        controller: userController,
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
                        controller: passwordController,
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
                          controller.display.value = true;

                          if (keyForm.currentState!.validate()) {
                            if (controller.files.isNotEmpty) {
                              AppService().processRegister(
                                name: nameController.text,
                                user: userController.text,
                                password: passwordController.text,
                              );
                            }
                          }
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
              GetX<AppController>(
                init: AppController(),
                initState: (_) {},
                builder: (AppController appController) {
                  return appController.files.isEmpty
                      ? const WidgetImage(path: 'images/avatar.png')
                      : Image.file(
                          appController.files.last,
                          fit: BoxFit.cover,
                        );
                },
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: WidgetIconButton(
                  icon: const Icon(Icons.photo_camera),
                  onPressed: () {
                    AppDialog().normalDialog(
                        iconWidget: const WidgetImage(
                          path: 'images/photo.png',
                        ),
                        titleWidget: const Text('Source Image'),
                        contentWidget: const Text('Please Choose Source Image'),
                        firstWidget: WidgetButton(
                          type: GFButtonType.outline2x,
                          text: 'Camera',
                          onPressed: () {
                            Get.back();

                            AppService()
                                .processGetImage(source: ImageSource.camera);
                          },
                        ),
                        secondWidget: WidgetButton(
                          text: 'Gallery',
                          onPressed: () {
                            Get.back();

                            AppService()
                                .processGetImage(source: ImageSource.gallery);
                          },
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
