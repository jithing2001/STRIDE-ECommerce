import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';

class ProfieEditFields extends StatelessWidget {
  String? hint;

  TextEditingController inputController;

  ProfieEditFields(
      {super.key, required this.hint, required this.inputController});

  @override
  Widget build(BuildContext context) {
    print('controller : ${inputController.text}');

    return TextFormField(
      controller: inputController,
      decoration: InputDecoration(
          hintText: '$hint',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: kblack))),
    );
  }
}
