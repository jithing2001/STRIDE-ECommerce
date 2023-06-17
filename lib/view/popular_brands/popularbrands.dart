import 'package:flutter/material.dart';

class PopularBrands extends StatelessWidget {
  String? imgpath;
  PopularBrands({super.key, required this.imgpath});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.black,
      child: Image(
        image: AssetImage('$imgpath'),
        height: 30,
      ),
    );
  }
}
