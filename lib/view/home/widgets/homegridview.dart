import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';

class HomeGridView extends StatelessWidget {
  String? imgPath;
  String? productName;
  String? productRate;
  HomeGridView(
      {super.key,
      required this.imgPath,
      required this.productName,
      required this.productRate});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 1,
      child: Container(
        // height: 400,
        width: 200,
        decoration: BoxDecoration(
            border: Border.all(color: kblack),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 200,
                  height: 160,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  clipBehavior: Clip.antiAlias,
                  child: Image(
                    image: NetworkImage(
                      '$imgPath',
                    ),
                    fit: BoxFit.cover,
                    // height: 120,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                kwidth20,
                SizedBox(
                  width: 165,
                  child: Text(
                    '$productName',
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                kwidth20,
                Text(
                  '₹$productRate',
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
