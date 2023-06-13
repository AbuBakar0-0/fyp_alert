import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fyp_alert/helper/apiMethods.dart';
import 'package:fyp_alert/screens/admin/selectDiscipline.dart';
import 'package:fyp_alert/screens/admin/selectFaculty.dart';
import 'package:fyp_alert/screens/constants.dart';
import 'package:get/get.dart';
import '../../widgets/cards.dart';

class AdminAlerts extends StatefulWidget {
  const AdminAlerts({Key? key}) : super(key: key);

  @override
  State<AdminAlerts> createState() => _AdminAlertsState();
}

class _AdminAlertsState extends State<AdminAlerts> {
  getFAB() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: const IconThemeData(size: 22),
      backgroundColor: Constant.primaryColor,
      visible: true,
      curve: Curves.bounceIn,
      children: [
        // FAB 1
        SpeedDialChild(
            child: const Icon(
              Icons.add_alert,
              color: Colors.white,
            ),
            backgroundColor: Constant.primaryColor,
            onTap: () {
              Get.to(() => const SelectFaculty());
            },
            label: 'Faculty Alert',
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Constant.primaryColor),
        // FAB 2
        SpeedDialChild(
          child: const Icon(Icons.add_alert, color: Colors.white),
          backgroundColor: Constant.primaryColor,
          onTap: () {
            Get.to(() => const SelectDiscipline());
          },
          label: 'Student Alert',
          labelStyle: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16.0),
          labelBackgroundColor: Constant.primaryColor,
        )
      ],
    );
  }

  TextEditingController search = TextEditingController();

  var alertList = [];
  var searchList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: Get.width,
          height: Get.height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                  future: getSentAlerts(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    try {
                      var snap = snapshot.data;
                      alertList = snap;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return alertList.length != 0
                          ? Column(
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: TextFormField(
                                    controller: search,
                                    onEditingComplete: () {
                                      searchList = alertList
                                          .where((element) => element['date']
                                              .contains(search.text))
                                          .toList();
                                      setState(() {});
                                    },
                                    cursorColor: Constant.primaryColor,
                                    style: TextStyle(
                                      color: Constant.primaryColor,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: Constant.primaryColor,
                                      ),
                                      labelStyle: TextStyle(
                                          color: Constant.primaryColor),
                                      contentPadding: const EdgeInsets.all(5),
                                      labelText: "Search",
                                      fillColor: const Color(0xff548fbb),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Constant.secondaryColor,
                                        ),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Constant.secondaryColor,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                searchList.length != 0
                                    ? ListView.builder(
                                        itemCount: searchList.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          return DateTime.parse(
                                                          searchList[index]
                                                                  ['date']
                                                              .toString())
                                                      .isBefore(
                                                          DateTime.now()) ||
                                                  DateTime.parse(
                                                          searchList[index]
                                                                  ['date']
                                                              .toString())
                                                      .isAtSameMomentAs(
                                                          DateTime.now())
                                              ? notificationSentCard(
                                                  searchList[index]['msg']
                                                      .toString(),
                                                  searchList[index]['date']
                                                      .toString(),
                                                )
                                              : const Text("");
                                        },
                                      )
                                    : ListView.builder(
                                        itemCount: snap.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          return DateTime.parse(alertList[index]
                                                              ['date']
                                                          .toString())
                                                      .isBefore(
                                                          DateTime.now()) ||
                                                  DateTime.parse(
                                                          alertList[index]
                                                                  ['date']
                                                              .toString())
                                                      .isAtSameMomentAs(
                                                          DateTime.now())
                                              ? notificationSentCard(
                                                  alertList[index]['msg']
                                                      .toString(),
                                                  alertList[index]['date']
                                                      .toString(),
                                                )
                                              : const Text("");
                                        },
                                      ),
                              ],
                            )
                          : const Center(child: Text("No Current Alerts"));
                    } catch (e) {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                )
              ],
            ),
          ),
        ),
        floatingActionButton: getFAB());
  }
}
