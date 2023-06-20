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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: 200,
          width: 350,
          // color: Colors.green,
          child: Column(
            children: [
              Stack(
                // fit: StackFit.expand,
                children: [
                  Container(
                    width: 350,
                    height: 140,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: AssetImage(
                          '$imgPath',
                        ),
                        // fit: BoxFit.cover,
                        height: 120,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        color: kblack,
                      ),
                      kwidth20
                    ],
                  )
                ],
              ),
              Text(
                '$productName',
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  kwidth40,
                  Text(
                    '$productRate',
                    style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
