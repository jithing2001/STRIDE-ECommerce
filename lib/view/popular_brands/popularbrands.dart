import 'package:flutter/material.dart';

class PopularBrands extends StatelessWidget {
  String? imgpath;
  String? brandName;
  PopularBrands({super.key, required this.imgpath, required this.brandName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.black,
          child: Image(
            image: NetworkImage('$imgpath'),
            height: 30,
          ),
        ),
        Text('$brandName')
      ],
    );
  }
}
