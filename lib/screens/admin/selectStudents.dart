import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/appbars.dart';
import '../../widgets/gaps.dart';
import '../constants.dart';
import 'addAlert.dart';

class SelectStudent extends StatefulWidget {
  const SelectStudent({Key? key}) : super(key: key);

  @override
  State<SelectStudent> createState() => _SelectStudentState();
}

class _SelectStudentState extends State<SelectStudent> {
  var isChecked = false;

  var names = [
    'NOMAN AHMAD',
    'RASHID',
    'SAFEER',
    'SAFI UCCAH',
    'SAMUEL ANWAR',
    'SAYED NAQI',
    'SHABANA SADIQ',
    'SHAHID NAWAZ',
    'SHAHZAD'
  ];

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
              height: Get.height/1.8,
              width: Get.width,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: names.length,
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    title: Text(names[index]),
                    value: isChecked,
                    onChanged: (newValue) {
                      setState(() {
                        isChecked = newValue!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  );
                },
              ),
            ),
            gap20(),
            GestureDetector(
              onTap: () {
                Get.to(() => AddAlert());
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
