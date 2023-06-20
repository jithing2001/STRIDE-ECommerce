import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';

class ProductSize extends StatelessWidget {
  String? size;
  ProductSize({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: kgrey,
      child: Text(
        '$size',
        style: TextStyle(color: kblack),
      ),
    );
  }
}