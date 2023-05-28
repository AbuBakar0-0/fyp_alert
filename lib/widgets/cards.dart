import 'package:flutter/material.dart';
import 'package:fyp_alert/screens/admin/addAlert.dart';
import 'package:fyp_alert/screens/constants.dart';
import 'package:fyp_alert/screens/student/alertDetail.dart';
import 'package:fyp_alert/widgets/gaps.dart';
import 'package:get/get.dart';

notificationCard(message,date,from) {
  return GestureDetector(
    onTap: (){
      Get.to(()=>AlertDetail.set(message: message,date: date,from:from));
    },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      width: Get.width,
      decoration:  BoxDecoration(
        color: Constant.whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow:const  [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2.5,
            offset: Offset(1, 1), // Shadow position
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(message),
          gap20(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: (Get.width/2)-30,child: Text("Date : $date" )),
              from!=''?SizedBox(width: (Get.width/2)-30,child: Text("From : $from")):Container(),
            ],
          ),
        ],
      ),
    ),
  );
}

groupCard(name){
  return GestureDetector(
    onTap: (){
      Get.to(()=>AddAlert.groups(groupName: name));
    },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      width: Get.width,
      decoration:  BoxDecoration(
        color: Constant.whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow:const  [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2.5,
            offset: Offset(1, 1), // Shadow position
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
        ],
      ),
    ),
  );
}