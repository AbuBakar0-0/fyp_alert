import 'package:flutter/material.dart';
import 'package:fyp_alert/screens/admin/alertHistory.dart';
import 'package:get/get.dart';

import '../screens/auth/login.dart';
import '../screens/constants.dart';

AppBar simpleAppbar() {
  return AppBar(
    iconTheme: IconThemeData(color: Constant.primaryColor),
    backgroundColor: Colors.white,
    title: const Image(
      image: AssetImage('assets/logo.png'),
      width: 50,
    ),
    centerTitle: true,
    actions: [
      Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
        child: GestureDetector(
          onTap: () {
            Get.offAll(const Login());
          },
          child: Icon(
            Icons.logout,
            color: Constant.primaryColor,
          ),
        ),
      ),
    ],
  );
}

AppBar adminTab() {
  return AppBar(
    iconTheme: IconThemeData(color: Constant.primaryColor),
    backgroundColor: Colors.white,
    title: const Image(
      image: AssetImage('assets/logo.png'),
      width: 50,
    ),
    centerTitle: true,
    actions: [
      Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
        child: GestureDetector(
          onTap: () {
            Get.to(() => const AlertHistory());
          },
          child: Icon(
            Icons.notifications_active_outlined,
            color: Constant.primaryColor,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
        child: GestureDetector(
          onTap: () {
            Get.offAll(const Login());
          },
          child: Icon(
            Icons.logout,
            color: Constant.primaryColor,
          ),
        ),
      ),
    ],
    bottom: TabBar(
      indicatorColor: Constant.primaryColor,
      tabs: const [
        Tab(
          icon: Text(
            'Alerts',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Tab(
          icon: Text(
            'Groups',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    ),
  );
}
