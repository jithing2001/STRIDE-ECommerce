import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';

class SignupFields extends StatelessWidget {
  String? title;
  String? hint;
  SignupFields({super.key, required this.title, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title',
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: hint,
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10))),
          ),
          kheight10
        ],
      ),
    );
  }
}
