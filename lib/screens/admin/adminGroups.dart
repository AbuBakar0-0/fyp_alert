import 'package:flutter/material.dart';
import 'package:fyp_alert/helper/apiMethods.dart';
import 'package:fyp_alert/screens/admin/addAlert.dart';
import 'package:fyp_alert/screens/admin/addGroup.dart';
import 'package:fyp_alert/screens/admin/editGroup.dart';
import 'package:get/get.dart';

import '../../widgets/cards.dart';
import '../constants.dart';

class AdminGroups extends StatefulWidget {
  const AdminGroups({Key? key}) : super(key: key);

  @override
  State<AdminGroups> createState() => _AdminGroupsState();
}

class _AdminGroupsState extends State<AdminGroups> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: getGroups(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                try {
                  var snap = snapshot.data;

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {}
                  return ListView.builder(
                    itemCount: snap.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return groupCard(snap[index].toString());
                    },
                  );
                } catch (e) {
                  return const Center(
                    child: Text(
                      "Connection Error...\nPlease check your Internet connection...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddGroup());
        },
        backgroundColor: Constant.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  groupCard(name) {
    return GestureDetector(
      onTap: () {
        Get.to(() => AddAlert.groups(groupName: name));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: Get.width,
        decoration: BoxDecoration(
          color: Constant.whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.5,
              offset: Offset(1, 1), // Shadow position
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.to(()=>EditGroup.set(groupName: name,));
                  },
                  icon: const Icon(Icons.edit),
                  color: Colors.green,
                ),
                IconButton(
                  onPressed: () async {
                    await deleteGroup(name);
                    setState(() {});
                  },
                  icon: const Icon(Icons.delete_forever),
                  color: Colors.red,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
