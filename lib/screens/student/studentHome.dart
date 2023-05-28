import 'package:flutter/material.dart';
import 'package:fyp_alert/widgets/appbars.dart';
import 'package:fyp_alert/widgets/cards.dart';
import 'package:fyp_alert/widgets/gaps.dart';
import 'package:get/get.dart';

import '../../helper/apiMethods.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppbar(),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Student Dashboard",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            gap10(),
            FutureBuilder(
              future: getAlerts(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                try {
                  var snap = snapshot.data;

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return snap.length!=0?ListView.builder(
                    itemCount: snap.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return notificationCard(snap[index]['msg'].toString(),
                          snap[index]['date'].toString(), snap[index]['name'].toString());
                    },
                  ):const Center(child:  Text("No Current Alerts"));
                } catch (e) {
                  return const Center(
                    child: Text(
                      "Connection Error...\nPlease check your Internet connection...",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  );
                }
              },
            )


          ],
        ),
      ),
    );
  }
}
