import 'package:flutter/material.dart';
import 'package:fyp_alert/screens/admin/selectStudents.dart';
import 'package:get/get.dart';


import '../../widgets/appbars.dart';
import '../../widgets/gaps.dart';
import '../constants.dart';
import 'addAlert.dart';

class SelectSection extends StatefulWidget {
  const SelectSection({Key? key}) : super(key: key);

  @override
  State<SelectSection> createState() => _SelectSectionState();
}

class _SelectSectionState extends State<SelectSection> {
  var isChecked = false;

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
                "Select Sections",
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
              ExpansionTile(
                title: CheckboxListTile(
                  title: const Text("BS-CS"),
                  value: isChecked,
                  onChanged: (newValue) {
                    setState(() {
                      isChecked = newValue!;
                    });
                  },
                  controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                children: [
                  Container(
                    padding:const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        CheckboxListTile(
                          title: const Text("A"),
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                          controlAffinity:
                          ListTileControlAffinity.leading, //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: const Text("B"),
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                          controlAffinity:
                          ListTileControlAffinity.leading, //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: const Text("C"),
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                          controlAffinity:
                          ListTileControlAffinity.leading, //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: const Text("D"),
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                          controlAffinity:
                          ListTileControlAffinity.leading, //  <-- leading Checkbox
                        ),

                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: CheckboxListTile(
                  title: const Text("BS-AI"),
                  value: isChecked,
                  onChanged: (newValue) {
                    setState(() {
                      isChecked = newValue!;
                    });
                  },
                  controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                children: [
                  Container(
                    padding:const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        CheckboxListTile(
                          title: const Text("A"),
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                          controlAffinity:
                          ListTileControlAffinity.leading, //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: const Text("B"),
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                          controlAffinity:
                          ListTileControlAffinity.leading, //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: const Text("C"),
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                          controlAffinity:
                          ListTileControlAffinity.leading, //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: const Text("D"),
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                          controlAffinity:
                          ListTileControlAffinity.leading, //  <-- leading Checkbox
                        ),

                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: CheckboxListTile(
                  title: const Text("BS-SE"),
                  value: isChecked,
                  onChanged: (newValue) {
                    setState(() {
                      isChecked = newValue!;
                    });
                  },
                  controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                children: [
                  Container(
                    padding:const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        CheckboxListTile(
                          title: const Text("A"),
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                          controlAffinity:
                          ListTileControlAffinity.leading, //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: const Text("B"),
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                          controlAffinity:
                          ListTileControlAffinity.leading, //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: const Text("C"),
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                          controlAffinity:
                          ListTileControlAffinity.leading, //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: const Text("D"),
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                          controlAffinity:
                          ListTileControlAffinity.leading, //  <-- leading Checkbox
                        ),

                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: CheckboxListTile(
                  title: const Text("BS-IT"),
                  value: isChecked,
                  onChanged: (newValue) {
                    setState(() {
                      isChecked = newValue!;
                    });
                  },
                  controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                children: [
                  Container(
                    padding:const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        CheckboxListTile(
                          title: const Text("A"),
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                          controlAffinity:
                          ListTileControlAffinity.leading, //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: const Text("B"),
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                          controlAffinity:
                          ListTileControlAffinity.leading, //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: const Text("C"),
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                          controlAffinity:
                          ListTileControlAffinity.leading, //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: const Text("D"),
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                          controlAffinity:
                          ListTileControlAffinity.leading, //  <-- leading Checkbox
                        ),

                      ],
                    ),
                  ),
                ],
              ),
              gap20(),
              GestureDetector(
                onTap: () {
                  Get.to(()=>SelectStudent());
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
