import 'package:flutter/material.dart';
import 'package:fyp_alert/widgets/buttons.dart';
import 'package:fyp_alert/widgets/gaps.dart';
import 'package:fyp_alert/widgets/textfields.dart';
import 'package:get/get.dart';

import '../constants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Constant.primaryColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding:const EdgeInsets.symmetric(horizontal: 30,vertical: 150),
          child: Container(
            padding:const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(image:  AssetImage('assets/logo.png'),width: 150,),
                gap20(),
                loginTextField("Name", username, Icons.person,false),
                loginTextField("Password", password, Icons.vpn_key,true),
                loginButton(username.text,password.text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
