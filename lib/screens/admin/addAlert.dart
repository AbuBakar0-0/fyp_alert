import 'package:flutter/material.dart';
import 'package:fyp_alert/screens/constants.dart';
import 'package:fyp_alert/widgets/buttons.dart';
import 'package:fyp_alert/widgets/gaps.dart';
import 'package:fyp_alert/widgets/textfields.dart';
import 'package:get/get.dart';

import '../../widgets/appbars.dart';

class AddAlert extends StatefulWidget {
  AddAlert({Key? key}) : super(key: key);

  @override
  State<AddAlert> createState() => _AddAlertState();
}

class _AddAlertState extends State<AddAlert> {
  TextEditingController message = TextEditingController();

  DateTime selectedDate = DateTime.now();

  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
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
        child: Column(
          children: [
            const Text(
              "Add New Alert",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            gap20(),
            gap20(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Date : ${"${selectedDate.toLocal()}".split(' ')[0]}",style: TextStyle(fontSize: 16),),
                const SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    selectDate(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Constant.primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Select Date",
                      style: TextStyle(color: Constant.whiteColor),
                    ),
                  ),
                )
              ],
            ),
            alertTextField("Message", message, Icons.message_outlined),
            addAlert(),
          ],
        ),
      ),
    );
  }
}
