import 'package:flutter/material.dart';

import '../screens/constants.dart';

loginTextField(title, controller, icon, obs) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5),
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: TextFormField(
      obscureText: obs,
      validator: (val) {},
      controller: controller,
      cursorColor: Constant.primaryColor,
      style: TextStyle(
        color: Constant.primaryColor,
        fontWeight: FontWeight.w800,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Constant.primaryColor,
        ),
        labelStyle: TextStyle(color: Constant.primaryColor),
        contentPadding: const EdgeInsets.all(5),
        labelText: title,
        fillColor: const Color(0xff548fbb),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Constant.secondaryColor,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Constant.secondaryColor,
            width: 2.0,
          ),
        ),
      ),
    ),
  );
}

alertTextField(title, controller, icon) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5),
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: TextFormField(
      maxLines: 8,
      controller: controller,
      cursorColor: Constant.primaryColor,
      style: TextStyle(
        color: Constant.primaryColor,
        fontWeight: FontWeight.w800,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Constant.primaryColor,
        ),
        labelStyle: TextStyle(color: Constant.primaryColor),
        contentPadding: const EdgeInsets.all(5),
        labelText: title,
        fillColor: const Color(0xff548fbb),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Constant.secondaryColor,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Constant.secondaryColor,
            width: 2.0,
          ),
        ),
      ),
    ),
  );
}

groupTextField(title, controller, icon) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5),
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: TextFormField(
      controller: controller,
      cursorColor: Constant.primaryColor,
      style: TextStyle(
        color: Constant.primaryColor,
        fontWeight: FontWeight.w800,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Constant.primaryColor,
        ),
        labelStyle: TextStyle(color: Constant.primaryColor),
        contentPadding: const EdgeInsets.all(5),
        labelText: title,
        fillColor: const Color(0xff548fbb),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Constant.secondaryColor,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Constant.secondaryColor,
            width: 2.0,
          ),
        ),
      ),
    ),
  );
}
