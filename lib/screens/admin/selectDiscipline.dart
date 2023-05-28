import 'package:flutter/material.dart';
import 'package:fyp_alert/helper/apiMethods.dart';
import 'package:fyp_alert/screens/admin/selectSemester.dart';
import 'package:fyp_alert/widgets/gaps.dart';
import 'package:get/get.dart';

import '../../widgets/appbars.dart';
import '../constants.dart';

class SelectDiscipline extends StatefulWidget {
  const SelectDiscipline({Key? key}) : super(key: key);

  @override
  State<SelectDiscipline> createState() => _SelectDisciplineState();
}

class _SelectDisciplineState extends State<SelectDiscipline> {
  var isChecked = false;
  var checkList = [];
  var disciplineList=[];


  var disciplineAll=[];
  genList(snap) {
    for (int i = 0; i < snap.length; i++) {
      checkList.add(false);
    }
    disciplineAll=snap;
  }

  selectAll() {
    for (int i = 0; i < checkList.length; i++) {
      checkList[i] == true;
    }
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
              "Select Discipline",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            gap20(),
            CheckboxListTile(
              title: const Text("Select All"),
              value: isChecked,
              onChanged: (newValue) {
                setState(() {
                  isChecked = newValue!;
                  if (isChecked) {
                    for (int i = 0; i < disciplineAll.length; i++) {
                      disciplineList.add(disciplineAll[i].toString());
                    }
                    for (int i = 0; i < checkList.length; i++) {
                      checkList[i] = true;
                    }
                    setState(() {});
                  } else {
                    disciplineList.clear();
                    for (int i = 0; i < checkList.length; i++) {
                      checkList[i] = false;
                    }
                  }

                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            gap20(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: FutureBuilder(
                      future: getDiscipline(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        try {
                          var snap = snapshot.data;
                          genList(snap);
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {}
                          return ListView.builder(
                            itemCount: snap.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                title: Text(snap[index].toString()),
                                value: checkList[index],
                                onChanged: (newValue) {
                                  disciplineList.add(snap[index].toString());
                                  setState(() {
                                    checkList[index] = newValue!;
                                  });
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              );
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
                    ),
                  ),
                ],
              ),
            ),
            gap20(),
            GestureDetector(
              onTap: () {
                Get.to(() => SelectSemester.set(disciplineList: disciplineList,));
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
