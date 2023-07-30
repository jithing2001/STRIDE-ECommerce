import 'package:ecommerce/constants.dart';
import 'package:ecommerce/view/settings/widgets/about.dart';
import 'package:ecommerce/view/settings/widgets/policy_dialog.dart';
import 'package:ecommerce/view/settings/widgets/settings_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import 'widgets/signout.dart';

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
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: kblack,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kwhite,
      ),
      body: Column(
        children: [
          kheight30,
          InkWell(
              onTap: () => Get.dialog(AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  content: const AboutDialogue())),
              child: SettingsWidget(icon: Icons.info, title: 'About')),
          InkWell(
              onTap: () => Share.share(
                  'https://play.google.com/store/apps/details?id=com.jithin.strideuser'),
              child:
                  SettingsWidget(icon: Icons.share, title: 'Invite Friends')),
          InkWell(
              onTap: () =>
                  Get.dialog(PolicyDialog(mdFileName: 'privacy_policy.md')),
              child: SettingsWidget(
                  icon: Icons.privacy_tip, title: 'Privacy Policy')),
          InkWell(
              onTap: () => Get.dialog(
                  PolicyDialog(mdFileName: 'terms_and_condition.md')),
              child: SettingsWidget(
                  icon: Icons.event_note, title: 'Terms and Conditions')),
          InkWell(
              onTap: () {
                Get.dialog(AlertDialog(
                  content: Signout(),
                ));
              },
              child: SettingsWidget(icon: Icons.logout, title: 'Log Out')),
        ],
      ),
    );
  }
}
