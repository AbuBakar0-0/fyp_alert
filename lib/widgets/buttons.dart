import 'package:flutter/material.dart';
import 'package:fyp_alert/helper/auth.dart';
import 'package:fyp_alert/screens/admin/adminHome.dart';
import 'package:fyp_alert/screens/constants.dart';
import 'package:fyp_alert/screens/student/studentHome.dart';
import 'package:get/get.dart';

loginButton(username,password) {
  return GestureDetector(
    onTap: () {
      login(username, password);
      //Get.offAll(()=>const StudentHome());
    },
    child: Container(
      alignment: Alignment.center,
      width: Get.width,
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Constant.primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child:const Text(
        "Login",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}
