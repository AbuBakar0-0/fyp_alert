import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/apiMethods.dart';
import '../../widgets/appbars.dart';
import '../../widgets/gaps.dart';
import '../constants.dart';
import 'addAlert.dart';

class SelectFaculty extends StatefulWidget {
  const SelectFaculty({Key? key}) : super(key: key);

  @override
  State<SelectFaculty> createState() => _SelectFacultyState();
}

class _SelectFacultyState extends State<SelectFaculty> {
  var isChecked = false;
  var tList = [];
  var facultyAll = [];
  var faculty = [];

  genList(snap) {
    for (int i = 0; i < snap.length; i++) {
      tList.add(false);
    }
    facultyAll = snap;
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
              "Select Faculty Members",
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
                    for (int i = 0; i < facultyAll.length; i++) {
                      faculty.add(facultyAll[i]['Emp_no']);
                    }
                    for (int i = 0; i < tList.length; i++) {
                      tList[i] = true;
                    }
                    setState(() {});
                  } else {
                    faculty.clear();
                    for (int i = 0; i < tList.length; i++) {
                      tList[i] = false;
                    }
                  }
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
            gap20(),
            const Text(
              "Faculty List",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            gap20(),
            SizedBox(
                height: Get.height / 1.8,
                width: Get.width,
                child: FutureBuilder(
                  future: getFaculty(),
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
                            title: Text(snap[index]['Emp_firstname'] +
                                " " +
                                snap[index]['Emp_middle'] +
                                " " +
                                snap[index]['Emp_lastname']),
                            value: tList[index],
                            onChanged: (newValue) {
                              faculty.add(snap[index]['Emp_no']);
                              setState(() {
                                tList[index] = newValue!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          );
                        },
                      );
                    } catch (e) {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                )),
            gap20(),
            GestureDetector(
              onTap: () {
                Get.to(() => AddAlert.checkBoxes(fromCheckBoxes: faculty));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                decoration: BoxDecoration(
                  color: Constant.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "Send Alert",
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
