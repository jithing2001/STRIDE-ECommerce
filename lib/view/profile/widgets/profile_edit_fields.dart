import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';

class ProfieEditFields extends StatelessWidget {
  String? hint;
  ProfieEditFields({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: '$hint',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: kblack))),
    );
  }
}