import 'package:flutter/material.dart';
import 'package:fyp_alert/helper/apiMethods.dart';
import 'package:fyp_alert/widgets/appbars.dart';
import 'package:get/get.dart';

import '../../widgets/gaps.dart';
import '../../widgets/textfields.dart';
import '../constants.dart';

class EditGroup extends StatefulWidget {
  EditGroup({Key? key}) : super(key: key);

  var groupName;
  EditGroup.set({this.groupName});
  @override
  State<EditGroup> createState() => _EditGroupState();
}

class _EditGroupState extends State<EditGroup> {

  TextEditingController aridNo = TextEditingController();
  var groupList=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppbar(),
      body:Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(widget.groupName.toString().toUpperCase(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              groupTextField("Arid Number", aridNo, Icons.group),
              GestureDetector(
                onTap: ()async {
                  groupList.add({"groupName":widget.groupName,"regNo":aridNo.text});
                  await addGroup(groupList);
                  groupList.clear();
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
                height: 500,
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
                child:
                FutureBuilder(
                  future: getGroupStudents(widget.groupName),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    try {
                      var snap = snapshot.data;

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {}
                      return ListView.builder(
                        itemCount: snap.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return studentCard(snap[index].toString());
                        },
                      );
                    } catch (e) {
                      return const Center(
                        child: Text(
                          "Connection Error...\nPlease check your Internet connection...",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      );
                    }
                  },
                )
              ),
              gap20(),
            ],
          ),
        ),
      ),
    );
  }

  studentCard(regno) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(regno),
          IconButton(
            onPressed: () async {
              await deleteStudent(widget.groupName,regno);
              setState(() {});
            },
            icon: const Icon(Icons.delete_forever),
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
