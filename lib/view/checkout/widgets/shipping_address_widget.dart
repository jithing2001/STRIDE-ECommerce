import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';

class ShippingFields extends StatelessWidget {
  String? detail;

  ShippingFields({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth20,
        Text(
          '$detail',
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}