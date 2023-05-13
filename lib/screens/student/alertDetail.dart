import 'package:flutter/material.dart';
import 'package:fyp_alert/widgets/gaps.dart';
import 'package:get/get.dart';

import '../../widgets/appbars.dart';

class AlertDetail extends StatefulWidget {
  AlertDetail({Key? key}) : super(key: key);

  var message, date, from;

  AlertDetail.set({this.message, this.date, this.from});

  @override
  State<AlertDetail> createState() => _AlertDetailState();
}

class _AlertDetailState extends State<AlertDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppbar(),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.center,
              child:  Text(
                "Alert Details",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ),
            gap20(),
            Text(
              "From : ${widget.from}",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            gap10(),
            Text(
              "Date : ${widget.date}",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            gap20(),
            Text(
              "Message : ${widget.message}",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
