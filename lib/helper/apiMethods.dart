import 'dart:convert';
import 'package:fyp_alert/helper/User.dart';

import 'ip.dart';
import 'package:http/http.dart' as http;

getDiscipline() async {
  String url = '$ip/getDiscipline'.toString();
  var result = await http.get(Uri.parse(url), headers: {"Content-Type": "application/json"});
  var responseBody = jsonDecode(result.body);
  return responseBody;
}

getSemesters(disciplineList) async {
  String url = '$ip/getSemesters'.toString();
  final jsonBody = jsonEncode(disciplineList);
  var result = await http.post(Uri.parse(url), headers: {"Content-Type": "application/json"},body: jsonBody);
  var responseBody = jsonDecode(result.body);
  return responseBody;
}

getSections(semesterList) async {
  String url = '$ip/getSections'.toString();
  final jsonBody = jsonEncode(semesterList);
  var result = await http.post(Uri.parse(url), headers: {"Content-Type": "application/json"},body: jsonBody);
  var responseBody = jsonDecode(result.body);
  return responseBody;
}


addGroup(groupList) async {
  String url = '$ip/addGroup'.toString();
  final jsonBody = jsonEncode(groupList);
  var result = await http.post(Uri.parse(url), headers: {"Content-Type": "application/json"},body: jsonBody);
  var responseBody = jsonDecode(result.body);
  return responseBody;
}

getGroups() async {
  String url = '$ip/getGroups'.toString();
  var result = await http.get(Uri.parse(url), headers: {"Content-Type": "application/json"});
  var responseBody = jsonDecode(result.body);
  return responseBody;
}

getGroupStudents(groupName) async {
  String url = '$ip/getGroupStudents?name=$groupName'.toString();
  var result = await http.get(Uri.parse(url), headers: {"Content-Type": "application/json"});
  var responseBody = jsonDecode(result.body);
  return responseBody;
}

addAlert(alertList) async {
  String url = '$ip/addAlert'.toString();
  final jsonBody = jsonEncode(alertList);
  var result = await http.post(Uri.parse(url), headers: {"Content-Type": "application/json"},body: jsonBody);
  var responseBody = jsonDecode(result.body);
  return responseBody;
}

getAlerts() async {
  String url = '$ip/getAlerts?id=${User.id}'.toString();
  var result = await http.get(Uri.parse(url), headers: {"Content-Type": "application/json"});
  var responseBody = jsonDecode(result.body);
  return responseBody;
}


getFaculty() async {
  String url = '$ip/getFaculty'.toString();
  var result = await http.get(Uri.parse(url), headers: {"Content-Type": "application/json"});
  var responseBody = jsonDecode(result.body);
  return responseBody;
}