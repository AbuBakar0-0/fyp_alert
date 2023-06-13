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

getSentAlerts() async {
  String url = '$ip/getSentAlerts?id=${User.id}'.toString();
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

getStudents(sectionList) async {
  String url = '$ip/getStudents'.toString();
  final jsonBody = jsonEncode(sectionList);
  var result = await http.post(Uri.parse(url), headers: {"Content-Type": "application/json"},body: jsonBody);
  var responseBody = jsonDecode(result.body);
  return responseBody;
}

deleteGroup(name) async {
  String url = '$ip/deleteGroup?val=$name'.toString();
  var result = await http.get(Uri.parse(url), headers: {"Content-Type": "application/json"});
  var responseBody = jsonDecode(result.body);
  return responseBody;
}

deleteStudent(name,regno) async {
  String url = '$ip/deleteStudent?name=$name&regno=$regno'.toString();
  var result = await http.get(Uri.parse(url), headers: {"Content-Type": "application/json"});
  var responseBody = jsonDecode(result.body);
  return responseBody;
}

updateAlert(id) async {
  String url = '$ip/updateAlert'.toString();
  final jsonBody = jsonEncode({"id":id.toString()});
  var result = await http.post(Uri.parse(url), headers: {"Content-Type": "application/json"},body: jsonBody);
  var responseBody = jsonDecode(result.body);
  return responseBody;
}