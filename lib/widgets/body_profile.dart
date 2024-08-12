// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ungconnectedapi/models/user_model.dart';

class BodyProfile extends StatelessWidget {
  const BodyProfile({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Name = ${userModel.name}'),
        Image.network(userModel.avatar),
      ],
    );
  }
}
