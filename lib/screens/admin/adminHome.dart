import 'package:flutter/material.dart';
import 'package:fyp_alert/widgets/appbars.dart';
import 'package:get/get.dart';

import '../../widgets/cards.dart';
import '../../widgets/gaps.dart';
import 'adminAlerts.dart';
import 'adminGroups.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  int cupertinoTabBarValue = 0;
  int cupertinoTabBarValueGetter() => cupertinoTabBarValue;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: adminTab(),
        body:TabBarView(
          children:[
            AdminAlerts(),
            AdminGroups(),
          ],
        ),
      ),
    );
  }
}
