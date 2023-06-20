import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        elevation: 0,
        centerTitle: true,
        title: const Text('Favorites',
            style: TextStyle(fontSize: 25, color: Colors.black)),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 70,
              width: double.infinity,
              child: Row(
                children: [
                  kwidth10,
                  Container(
                      height: 80,
                      width: 80,
                      decoration:
                          BoxDecoration(border: Border.all(color: kblack)),
                      child: const Image(
                        image: AssetImage('assets/images/images (1).png'),
                        // fit: BoxFit.fill,
                      )),
                  kwidth40,
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Nike Flex Control',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text('₹2500',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        size: 30,
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
