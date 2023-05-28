import 'dart:convert';

import 'package:dio/dio.dart';

import 'ip.dart';

login(username,password) async{
  try{
    var dio = Dio();
    String url = '$ip/login?username=2018-arid-0184&password=123'.toString();
    //String url = '$ip/login?username=$username&password=$password'.toString();
    var response = await dio.get(url);
    var res = jsonDecode(response.toString());

  }catch(e){
    print(e);
  }
}