import 'package:flutter/material.dart';
import 'package:fyp_alert/widgets/gaps.dart';
import 'package:get/get.dart';

import '../../helper/apiMethods.dart';
import '../../widgets/appbars.dart';
import '../../widgets/cards.dart';

class AdminAlertDetail extends StatefulWidget {
  const AdminAlertDetail({Key? key}) : super(key: key);

  @override
  State<AdminAlertDetail> createState() => _AdminAlertDetailState();
}

class _AdminAlertDetailState extends State<AdminAlertDetail> {
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
                future: getSentAlerts(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  try {
                    var snap = snapshot.data;
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Seen by",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          gap20(),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snap.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return snap[index]['status']=='Read'? Text(snap[index]['to'].toString()): Container();
                            },
                          ),
                          gap20(),
                          gap20(),

                          const  Text("Unseen By",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          gap20(),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snap.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return snap[index]['status']!='Read'? Text(snap[index]['to'].toString()): Container();
                            },
                          ),
                        ],
                      ),
                    );
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
