import 'package:flutter/material.dart';
import 'package:fyp_alert/helper/User.dart';
import 'package:fyp_alert/screens/admin/adminHome.dart';
import 'package:fyp_alert/screens/constants.dart';
import 'package:fyp_alert/widgets/buttons.dart';
import 'package:fyp_alert/widgets/gaps.dart';
import 'package:fyp_alert/widgets/textfields.dart';
import 'package:get/get.dart';

import '../../helper/apiMethods.dart';
import '../../widgets/appbars.dart';
import '../../widgets/cards.dart';

class AddAlert extends StatefulWidget {
  AddAlert({Key? key}) : super(key: key);

  var groupName = '';
  var fromCheckBoxes = [];

  AddAlert.groups({required this.groupName});

  AddAlert.checkBoxes({required this.fromCheckBoxes});

  @override
  State<AddAlert> createState() => _AddAlertState();
}

class _AddAlertState extends State<AddAlert> {
  var studentList = [];
  var alertList = [];
  TextEditingController message = TextEditingController();

  DateTime selectedDate = DateTime.now();

  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  genList(snap) {
    studentList = [];
    studentList = snap;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.fromCheckBoxes);
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
                "Add New Alert",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              gap20(),
              gap20(),
              widget.groupName != ''
                  ? FutureBuilder(
                      future: getGroupStudents(widget.groupName),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        try{
                          var snap = snapshot.data;
                          genList(snap);
                        }catch(e){
                        }
                        return Container();
                      },
                    )
                  : Container(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date : ${"${selectedDate.toLocal()}".split(' ')[0]}",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      selectDate(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Constant.primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Select Date",
                        style: TextStyle(color: Constant.whiteColor),
                      ),
                    ),
                  )
                ],
              ),
              alertTextField("Message", message, Icons.message_outlined),
              GestureDetector(
                onTap: () async {
                  if(widget.groupName != ''){
                    alertList.clear();
                    print("called");
                    for (int i = 0; i < studentList.length; i++) {
                      alertList.add({
                        "from": User.id,
                        "to": studentList[i],
                        "date": "${"${selectedDate.toLocal()}".split(' ')[0]}",
                        "msg": message.text,
                      });
                    }
                    await addAlert(alertList);
                  }
                  if(widget.fromCheckBoxes.length!=0){
                    alertList.clear();
                    for (int i = 0; i < widget.fromCheckBoxes.length; i++) {
                      alertList.add({
                        "from": User.id,
                        "to": widget.fromCheckBoxes[i],
                        "date": "${selectedDate.toLocal()}".split(' ')[0],
                        "msg": message.text,
                      });
                    }
                    await addAlert(alertList);
                  }
                  Get.to(()=>AdminHome());

                },
                child: Container(
                  alignment: Alignment.center,
                  width: Get.width,
                  height: 50,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Constant.primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    "Send Alert",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
