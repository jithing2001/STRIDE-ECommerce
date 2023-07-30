import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';

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
