import 'package:ecommerce/constants.dart';
import 'package:ecommerce/service/authentication.dart';
import 'package:ecommerce/view/user/login/userlogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsClass extends StatelessWidget {
  const SettingsClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kwhite,
      ),
      body: Column(
        children: [
          kheight30,
          SettingsWidget(icon: Icons.info, title: 'About'),
          SettingsWidget(icon: Icons.share, title: 'Invite Friends'),
          SettingsWidget(icon: Icons.privacy_tip, title: 'Privacy Policy'),
          SettingsWidget(icon: Icons.event_note, title: 'Terms and Conditions'),
          InkWell(
              onTap: () {
                Get.dialog(AlertDialog(
                  content: SizedBox(
                    height: 100,
                    width: 100,
                    child: Column(
                      children: [
                        const Text('Are you sure?'),
                        kheight30,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () async {
                                  await Authentication().signOut();
                                  Get.offAll(UserLogin());
                                },
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.green),
                                )),
                            kwidth30,
                            InkWell(
                                onTap: () => Get.back(),
                                child: const Text(
                                  'No',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.red),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ));
              },
              child: SettingsWidget(icon: Icons.logout, title: 'Log Out')),
        ],
      ),
    );
  }
}

class SettingsWidget extends StatelessWidget {
  IconData? icon;
  String? title;
  SettingsWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: kblack),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            kwidth10,
            Icon(
              icon,
              size: 30,
            ),
            kwidth20,
            Text(
              '$title',
              style: const TextStyle(
                fontSize: 23,
              ),
            )
          ],
        ),
      ),
    );
  }
}
