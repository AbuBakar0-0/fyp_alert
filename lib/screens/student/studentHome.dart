import 'package:flutter/material.dart';
import 'package:fyp_alert/widgets/appbars.dart';
import 'package:fyp_alert/widgets/cards.dart';
import 'package:fyp_alert/widgets/gaps.dart';
import 'package:get/get.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppbar(),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Student Dashboard",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            gap10(),
            notificationCard("BIIT will remain off. Classes will commence from Monday","13-May-2023","BIIT ADMIN"),
            notificationCard("BIIT will remain off. Classes will commence from Monday","13-May-2023","BIIT ADMIN"),
            notificationCard("BIIT will remain off. Classes will commence from Monday","13-May-2023","BIIT ADMIN"),
          ],
        ),
      ),
    );
  }
}
