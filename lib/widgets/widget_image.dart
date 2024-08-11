// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetImage extends StatelessWidget {
  const WidgetImage({
    Key? key,
    this.path,
  }) : super(key: key);

  final String? path;

  @override
  Widget build(BuildContext context) {
    return Image.asset(path ?? 'images/login.png');
  }
}
