import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class WidgetIconButton extends StatelessWidget {
  const WidgetIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final Widget icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GFIconButton(
      icon: icon,
      onPressed: onPressed,
      type: GFButtonType.transparent,
      color: Theme.of(context).primaryColor,
    );
  }
}
