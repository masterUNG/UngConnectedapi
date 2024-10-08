// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class WidgetButton extends StatelessWidget {
  const WidgetButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fullWidthButton,
    this.type,
  }) : super(key: key);

  final String text;
  final Function() onPressed;
  final bool? fullWidthButton;
  final GFButtonType? type;

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: onPressed,
      text: text,
      color: Theme.of(context).primaryColor,
      fullWidthButton: fullWidthButton,type: type ?? GFButtonType.solid,
    );
  }
}
