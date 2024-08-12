// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ungconnectedapi/models/user_model.dart';
import 'package:ungconnectedapi/utility/app_controller.dart';
import 'package:ungconnectedapi/widgets/body_list_data.dart';
import 'package:ungconnectedapi/widgets/body_profile.dart';

class MainHome extends StatefulWidget {
  const MainHome({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  final UserModel userModel;

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  var titles = <String>[
    'List Data',
    'Profile',
  ];

  var icons = <IconData>[
    Icons.list,
    Icons.person,
  ];

  var bodys = <Widget>[
    const BodyListData(),
  ];

  List<BottomNavigationBarItem> items = [];

  @override
  void initState() {
    super.initState();



    bodys.add(BodyProfile(userModel: widget.userModel));


    

    for (var i = 0; i < bodys.length; i++) {
      items.add(
        BottomNavigationBarItem(
          icon: Icon(icons[i]),
          label: titles[i],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX<AppController>(
      init: AppController(),
      initState: (_) {},
      builder: (AppController appController) {
        return Scaffold(
          appBar: AppBar(
            title: Text(titles[appController.indexBody.value]),
          ),
          body: bodys[appController.indexBody.value],
          bottomNavigationBar: BottomNavigationBar(
            items: items,
            currentIndex: appController.indexBody.value,
            onTap: (value) {
              appController.indexBody.value = value;
            },
          ),
        );
      },
    );
  }
}
