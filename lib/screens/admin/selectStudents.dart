import 'package:flutter/material.dart';
import 'package:fyp_alert/helper/apiMethods.dart';
import 'package:get/get.dart';

import '../../widgets/appbars.dart';
import '../../widgets/gaps.dart';
import '../constants.dart';
import 'addAlert.dart';

class SelectStudent extends StatefulWidget {
  SelectStudent({Key? key}) : super(key: key);

  var sectionList;

  SelectStudent.set({this.sectionList});

  @override
  State<SelectStudent> createState() => _SelectStudentState();
}

class _SelectStudentState extends State<SelectStudent> {
  var isChecked = false;

  var studentList = [];
  var studentAll=[];
  var selectedStudents=[];

  genList(snap) {
    for (int i = 0; i < snap.length; i++) {
      studentList.add(false);
    }
    studentAll = snap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppbar(),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const Text(
              "Select Students",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            gap20(),
            CheckboxListTile(
              title: const Text("Select All"),
              value: isChecked,
              onChanged: (newValue) {
                setState(() {
                  isChecked = newValue!;
                  if(isChecked){
                    for(int i=0;i<studentAll.length;i++){
                      studentList[i]=true;
                      selectedStudents.add(studentAll[i]['Reg_No']);
                    }
                  }
                  else{
                    selectedStudents.clear();
                    for(int i=0;i<studentAll.length;i++){
                      studentList[i]=false;
                    }
                  }
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
            gap20(),
            const Text(
              "Students List",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            gap20(),
            SizedBox(
                height: Get.height / 1.8,
                width: Get.width,
                child: FutureBuilder(
                  future: getStudents(widget.sectionList),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    try {
                      var snap = snapshot.data;
                      genList(snap);
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {}
                      return ListView.builder(
                        itemCount: snap.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return CheckboxListTile(
                            title: Text(snap[index]['name'].toString()),
                            value: studentList[index],
                            onChanged: (newValue) {
                              setState(() {
                                studentList[index] = newValue!;
                                if(studentList[index]){
                                  selectedStudents.add(snap[index]['Reg_No'].toString());
                                }else{
                                  selectedStudents.removeWhere((item) => item.toString().contains(snap[index]['Reg_No'].toString()));
                                }
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          );
                        },
                      );
                    } catch (e) {
                      print(e);
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                )),
            gap20(),
            GestureDetector(
              onTap: () {
                Get.to(() => AddAlert.checkBoxes(fromCheckBoxes: selectedStudents));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                decoration: BoxDecoration(
                  color: Constant.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(color: Constant.whiteColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
