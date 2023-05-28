import 'package:flutter/material.dart';
import 'package:fyp_alert/helper/apiMethods.dart';
import 'package:fyp_alert/screens/admin/selectSection.dart';
import 'package:get/get.dart';

import '../../widgets/appbars.dart';
import '../../widgets/gaps.dart';
import '../constants.dart';

class SelectSemester extends StatefulWidget {
  SelectSemester({Key? key}) : super(key: key);

  var disciplineList;

  SelectSemester.set({this.disciplineList});

  @override
  State<SelectSemester> createState() => _SelectSemesterState();
}

class _SelectSemesterState extends State<SelectSemester> {
  var isChecked = false;
  var sectionCheckList = [];
  var semesterCheckList = [];

  var semesterAll = [];
  var semesterList = [];

  var finalList = [];

  genList(snap) {
    for (int i = 0; i < widget.disciplineList.length; i++) {
      sectionCheckList.add(false);
    }
    for (int i = 0; i < snap.length; i++) {
      semesterCheckList.add(false);
    }
    semesterAll = snap;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < widget.disciplineList.length; i++) {
      semesterList.add([]);
      semesterList[i].add(widget.disciplineList[i]);
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Select Semester",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              gap20(),
              CheckboxListTile(
                title: const Text("Select All"),
                value: isChecked,
                onChanged: (newValue) {
                  setState(() {
                    isChecked = newValue!;
                    semesterList.clear();
                    if (isChecked) {
                      for (int i = 0; i < widget.disciplineList.length; i++) {
                        semesterList.add([]);
                        semesterList[i].add(widget.disciplineList[i]);
                        for (int j = 0; j < semesterAll.length; j++) {
                          if (semesterAll[j]['DISCIPLINE'] ==
                              semesterList[i][0]) {
                            semesterList[i].add(semesterAll[j]['SemC']);
                          }
                        }
                      }
                      for (int i = 0; i < sectionCheckList.length; i++) {
                        sectionCheckList[i] = true;
                      }
                      for (int i = 0; i < semesterAll.length; i++) {
                        semesterCheckList[i] = true;
                      }
                      print(semesterList);
                    } else {
                      for (int i = 0; i < sectionCheckList.length; i++) {
                        sectionCheckList[i] = false;
                      }
                      for (int i = 0; i < semesterAll.length; i++) {
                        semesterCheckList[i] = false;
                      }
                      semesterList.clear();
                    }
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
              gap20(),
              SizedBox(
                width: Get.width,
                height: Get.height - 350,
                child: FutureBuilder(
                  future: getSemesters(widget.disciplineList),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    try {
                      var snap = snapshot.data;
                      genList(snap);
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {}
                      return ListView.builder(
                        itemCount: widget.disciplineList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                            title: CheckboxListTile(
                              title: Text(widget.disciplineList[index]),
                              value: sectionCheckList[index],
                              onChanged: (newValue) {
                                setState(() {
                                  sectionCheckList[index] = newValue!;
                                  if (sectionCheckList[index]) {
                                    semesterList.add([]);
                                    semesterList[index].clear();
                                    semesterList[index]
                                        .add(widget.disciplineList[index]);
                                    if (semesterList[index].length == 0) {
                                      semesterList[index]
                                          .add(widget.disciplineList[index]);
                                    }
                                    for (int j = 0; j < semesterAll.length; j++) {
                                      if (semesterAll[j]['DISCIPLINE'] == widget.disciplineList[index]) {
                                        semesterList[index].add(semesterAll[j]['SemC']);
                                      }
                                    }
                                    for (int i = 0; i < semesterAll.length; i++) {
                                      if (semesterAll[i]['DISCIPLINE'] == widget.disciplineList[index]) {
                                        semesterCheckList[i] = true;
                                      }

                                    }
                                  } else {
                                    for (int i = 0; i < semesterAll.length; i++) {
                                      semesterCheckList[i] = false;
                                    }
                                    semesterList[index].clear();
                                  }
                                });
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: snap.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index2) {
                                    return snap[index2]['DISCIPLINE'] ==
                                            widget.disciplineList[index]
                                        ? CheckboxListTile(
                                            title: Text(snap[index2]['SemC']),
                                            value: semesterCheckList[index2],
                                            onChanged: (newValue) {
                                              setState(() {
                                                semesterCheckList[index2] = newValue!;
                                                if (semesterList[index].length == 0) {
                                                  semesterList[index].add(widget.disciplineList[index]);
                                                }
                                                semesterList[index].add(snap[index2]['SemC']);
                                              });
                                            },
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                          )
                                        : Container();
                                  },
                                ),
                              ),
                            ],
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
              gap20(),
              GestureDetector(
                onTap: () {
                  finalList.clear();
                  for (int i = 0; i < semesterList.length; i++) {
                    if (semesterList[i].length != 0) {
                      finalList.add(semesterList[i]);
                    }
                  }
                  Get.to(() => SelectSection.set(semesterList: finalList));
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
      ),
    );
  }
}
