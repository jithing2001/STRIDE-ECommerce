import 'package:flutter/material.dart';

class PaymentsWidgets extends StatelessWidget {
  String? imgPath;
  String? payments;
  IconData? icon;

  PaymentsWidgets(
      {super.key,
      required this.imgPath,
      required this.payments,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: Image(
            image: AssetImage('$imgPath'),
            fit: BoxFit.cover,
          ),
        ),
        Text(
          '$payments',
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(icon))
      ],
    );
  }
}
