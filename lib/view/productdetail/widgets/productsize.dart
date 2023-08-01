import 'package:flutter/material.dart';

class ProductSize extends StatelessWidget {
  String? size;
  Color color;
  Color textcolor;

  ProductSize({super.key, required this.size, required this.color,required this.textcolor});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      child: Text(
        '$size',
        style: TextStyle(color: textcolor),
      ),
    );
    
  }
}
