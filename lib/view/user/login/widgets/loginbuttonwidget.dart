import 'package:flutter/material.dart';

class loginbottonwidget extends StatelessWidget {
  String? title;
  final Function() onPressed;
  // final dynamic page;
  loginbottonwidget({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 40,
        child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              '$title',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
