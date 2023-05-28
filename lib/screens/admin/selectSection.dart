import 'package:flutter/material.dart';
import 'package:fyp_alert/helper/apiMethods.dart';
import 'package:fyp_alert/screens/admin/selectStudents.dart';
import 'package:get/get.dart';


import '../../widgets/appbars.dart';
import '../../widgets/gaps.dart';
import '../constants.dart';
import 'addAlert.dart';

class SelectSection extends StatefulWidget {
  SelectSection({Key? key}) : super(key: key);

  var semesterList;
  SelectSection.set({this.semesterList});

  @override
  State<SelectSection> createState() => _SelectSectionState();
}

class _SelectSectionState extends State<SelectSection> {
  var isChecked = false;


  var disciplineList=[];
  var sectionsList=[];

  var selectedSections=[];

  genList(snap){
    for(int i=0;i<widget.semesterList.length;i++){
      disciplineList.add(false);
    }
    for(int i=0;i<snap.length;i++){
      sectionsList.add(false);
    }
  }
  @override
  Widget build(BuildContext context) {
    print(widget.semesterList);
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
                    selectedSections.clear();
                    if (isChecked) {


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
                  future: getSections(widget.semesterList),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    try {
                      var snap = snapshot.data;
                      genList(snap);
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {}
                      return ListView.builder(
                        itemCount: widget.semesterList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                            title: CheckboxListTile(
                              title: Text(widget.semesterList[index][0].toString()),
                              value: disciplineList[index],
                              onChanged: (newValue) {
                                setState(() {
                                  disciplineList[index] = newValue!;
                                });
                              },
                              controlAffinity: ListTileControlAffinity
                                  .leading,
                            ),
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: snap.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index2) {
                                    return snap[index2]['DISCIPLINE']==widget.semesterList[index][0]? CheckboxListTile(
                                      title: Text(snap[index2]['SemC']+"-"+snap[index2]['SECTION']),
                                      value: sectionsList[index2],
                                      onChanged: (newValue) {
                                        setState(() {
                                          sectionsList[index2] = newValue!;
                                        });
                                      },
                                      controlAffinity:
                                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                                    ):Container();
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
