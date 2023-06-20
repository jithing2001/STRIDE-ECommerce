import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProfileFormFields extends StatelessWidget {
  String? title;
  String? input;

  TextEditingController inputcontroller = TextEditingController();

  ProfileFormFields({super.key, required this.title, required this.input});

  @override
  Widget build(BuildContext context) {
    inputcontroller.text = input!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$title',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        kheight10,
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            controller: inputcontroller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: kblack),
                    borderRadius: BorderRadius.circular(10))),
          ),
        )
      ],
    );
  }
}
