import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fyp_alert/helper/User.dart';
import 'package:fyp_alert/screens/admin/adminHome.dart';
import 'package:fyp_alert/screens/student/studentHome.dart';
import 'package:get/get.dart';

import 'ip.dart';


login(username,password) async{
  try{
    print("CAlled");
    var dio = Dio();
    //String url = '$ip/login?username=2018-arid-0184&password=123'.toString();
    String url = '$ip/login?username=BIIT179&password=1'.toString();
    //String url = '$ip/login?username=$username&password=$password'.toString();
    print(url);
    var response = await dio.get(url);
    var res = jsonDecode(response.toString());

    print(res);
    if(res['role']=='teacher'){
      User.id=res['Emp_no'];
      User.firstName=res['Emp_firstname'];
      User.middleName=res['Emp_middle'];
      User.lastName =res['Emp_lastname'];
      User.role=res['role'];
      Get.offAll(()=> const AdminHome());
    }
    else if(res['role'].toString().toLowerCase()=='student'){
      User.id=res['Reg_No'];
      User.firstName=res['St_firstname'];
      User.middleName=res['St_middlename'];
      User.lastName =res['St_lastname'];
      User.role=res['role'];
      Get.offAll(()=> const StudentHome());
    }
  }catch(e){
    print(e);
  }
}