import 'package:flutter/material.dart';
import 'package:fyp_alert/screens/admin/adminHome.dart';
import 'package:fyp_alert/screens/constants.dart';
import 'package:get/get.dart';

loginButton(username,password) {
  return GestureDetector(
    onTap: () {
      Get.offAll(()=>const AdminHome());
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

addAlert(){
  return GestureDetector(
    onTap: () {

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
        "Send Alert",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}