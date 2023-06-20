import 'package:flutter/material.dart';

class AddAdressWidget extends StatelessWidget {
  String? detail;
  AddAdressWidget({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$detail',
      style: const TextStyle(fontSize: 18),
    );
  }
}