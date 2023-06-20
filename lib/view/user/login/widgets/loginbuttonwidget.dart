import 'package:flutter/material.dart';
import 'package:get/get.dart';

class loginbottonwidget extends StatelessWidget {
  String? title;
  final dynamic page;
  loginbottonwidget({super.key, required this.title, required this.page});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 40,
        child: ElevatedButton(
            onPressed: () {
              Get.off(page);
            },
            child: Text(
              '$title',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
