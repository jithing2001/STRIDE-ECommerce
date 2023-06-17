import 'package:flutter/material.dart';

class loginbottonwidget extends StatelessWidget {
  String? title;
  loginbottonwidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 40,
        child: ElevatedButton(
            onPressed: () {},
            child: Text(
              '$title',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
