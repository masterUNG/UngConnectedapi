import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungconnectedapi/widgets/widget_button.dart';

class AppDialog {
  
  void normalDialog({
    Widget? iconWidget,
    Widget? titleWidget,
    Widget? contentWidget,
    Widget? firstWidget,
    Widget? secondWidget,
  }) {
    Get.dialog(
        AlertDialog(
          icon: iconWidget,
          title: titleWidget,
          content: contentWidget,
          actions: [
            firstWidget ?? const SizedBox(),
            secondWidget ??
                WidgetButton(
                  text: 'OK',
                  onPressed: () => Get.back(),
                )
          ],
        ),
        barrierDismissible: false);
  }
}
