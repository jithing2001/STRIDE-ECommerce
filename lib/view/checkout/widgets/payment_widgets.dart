import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';

class PaymentsWidgets extends StatelessWidget {
  String? imgPath;
  String? payments;

  PaymentsWidgets({
    super.key,
    required this.imgPath,
    required this.payments,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kblue,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                style: TextStyle(fontSize: 25, color: kwhite),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
