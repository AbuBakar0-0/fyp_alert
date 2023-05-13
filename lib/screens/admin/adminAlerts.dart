import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fyp_alert/screens/admin/selectDiscipline.dart';
import 'package:fyp_alert/screens/admin/selectFaculty.dart';
import 'package:fyp_alert/screens/constants.dart';
import 'package:get/get.dart';
import '../../widgets/cards.dart';

class AdminAlerts extends StatefulWidget {
  const AdminAlerts({Key? key}) : super(key: key);

  @override
  State<AdminAlerts> createState() => _AdminAlertsState();
}

class _AdminAlertsState extends State<AdminAlerts> {
  getFAB() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: const IconThemeData(size: 22),
      backgroundColor: Constant.primaryColor,
      visible: true,
      curve: Curves.bounceIn,
      children: [
        // FAB 1
        SpeedDialChild(
            child: const Icon(Icons.add_alert,color: Colors.white,),
            backgroundColor: Constant.primaryColor,
            onTap: () {
              Get.to(()=>const SelectFaculty());
            },
            label: 'Faculty Alert',
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Constant.primaryColor),
        // FAB 2
        SpeedDialChild(
          child: const Icon(Icons.add_alert,color: Colors.white),
          backgroundColor: Constant.primaryColor,
          onTap: () {
            Get.to(()=>const SelectDiscipline());
          },
          label: 'Student Alert',
          labelStyle: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16.0),
          labelBackgroundColor: Constant.primaryColor,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: Get.width,
          height: Get.height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              notificationCard(
                  "BIIT will remain off. Classes will commence from Monday",
                  "13-May-2023",
                  "BIIT ADMIN"),
              notificationCard(
                  "BIIT will remain off. Classes will commence from Monday",
                  "13-May-2023",
                  "BIIT ADMIN"),
              notificationCard(
                  "BIIT will remain off. Classes will commence from Monday",
                  "13-May-2023",
                  "BIIT ADMIN"),
            ],
          ),
        ),
        floatingActionButton: getFAB());
  }
}
