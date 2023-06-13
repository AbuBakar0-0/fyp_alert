import 'package:flutter/material.dart';
import 'package:fyp_alert/screens/admin/adminGroups.dart';
import 'package:fyp_alert/screens/admin/adminHome.dart';
import 'package:fyp_alert/widgets/textfields.dart';
import 'package:get/get.dart';

import '../../helper/apiMethods.dart';
import '../../widgets/appbars.dart';
import '../../widgets/gaps.dart';
import '../constants.dart';

class AddGroup extends StatefulWidget {
  AddGroup({Key? key}) : super(key: key);

  @override
  State<AddGroup> createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  TextEditingController groupName = TextEditingController();
  TextEditingController aridNo = TextEditingController();
  var groupList=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppbar(),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Add New Group",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              gap20(),
              gap20(),
              groupTextField("Group Name", groupName, Icons.group),
              groupTextField("Arid Number", aridNo, Icons.group),
              GestureDetector(
                onTap: () {
                  groupList.add({"groupName":groupName.text,"regNo":aridNo.text});
                  aridNo.text='';
                  setState(() {
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Constant.primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "Add Student",
                    style: TextStyle(color: Constant.whiteColor),
                  ),
                ),
              ),
              gap20(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ListView.builder(itemCount: groupList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Text(groupList[index]['regNo'].toString());
                    }),
              ),
              gap20(),
              GestureDetector(
                onTap: ()async {
                  await addGroup(groupList);
                  Get.offAll(()=>const AdminHome());
                },
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Constant.primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "Add Group",
                    style: TextStyle(color: Constant.whiteColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
