import 'package:flutter/material.dart';
import 'package:fyp_alert/screens/admin/addGroup.dart';
import 'package:get/get.dart';

import '../../widgets/cards.dart';
import '../constants.dart';


class AdminGroups extends StatefulWidget {
  const AdminGroups({Key? key}) : super(key: key);

  @override
  State<AdminGroups> createState() => _AdminGroupsState();
}

class _AdminGroupsState extends State<AdminGroups> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            groupCard("Group 1"),
            groupCard("Group 2"),
            groupCard("Group 3"),
            groupCard("Group 4"),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(()=>AddGroup());
        },
        backgroundColor: Constant.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
