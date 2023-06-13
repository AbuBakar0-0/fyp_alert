import 'package:flutter/material.dart';
import 'package:fyp_alert/widgets/appbars.dart';
import 'package:get/get.dart';

import '../../helper/apiMethods.dart';
import '../../widgets/cards.dart';
import '../constants.dart';

class AlertHistory extends StatefulWidget {
  const AlertHistory({Key? key}) : super(key: key);

  @override
  State<AlertHistory> createState() => _AlertHistoryState();
}

class _AlertHistoryState extends State<AlertHistory> {
  TextEditingController search = TextEditingController();

  var alertList = [];
  var searchList = [];

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                future: getAlerts(),
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
                                margin: const EdgeInsets.symmetric(vertical: 5),
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
                                    labelStyle:
                                        TextStyle(color: Constant.primaryColor),
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
                                        print(DateTime.parse(searchList[index]
                                                    ['date']
                                                .toString())
                                            .isBefore(DateTime.now()));
                                        return DateTime.parse(searchList[index]
                                                            ['date']
                                                        .toString())
                                                    .isBefore(DateTime.now()) ||
                                                DateTime.parse(searchList[index]
                                                            ['date']
                                                        .toString())
                                                    .isAtSameMomentAs(
                                                        DateTime.now())
                                            ? notificationCard(
                                                searchList[index]['msg']
                                                    .toString(),
                                                searchList[index]['date']
                                                    .toString(),
                                                searchList[index]['name']
                                                    .toString(),
                                                alertList[index]['id']
                                                    .toString(),
                                          alertList[index]['status']
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
                                                    .isBefore(DateTime.now()) ||
                                                DateTime.parse(alertList[index]
                                                            ['date']
                                                        .toString())
                                                    .isAtSameMomentAs(
                                                        DateTime.now())
                                            ? notificationCard(
                                                alertList[index]['msg']
                                                    .toString(),
                                                alertList[index]['date']
                                                    .toString(),
                                                alertList[index]['name']
                                                    .toString(),
                                                alertList[index]['id']
                                                    .toString(),
                                          alertList[index]['status']
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
    );
  }
}
