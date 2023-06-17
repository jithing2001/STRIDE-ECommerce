import 'package:ecommerce/view/home/widgets/homegridview.dart';
import 'package:flutter/material.dart';

class UnderArmourClass extends StatelessWidget {
  const UnderArmourClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'UNDER ARMOUR',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(240, 249, 247, 247),
        elevation: 0,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: [
          HomeGridView(
              imgPath: 'assets/images/nike flex control.png',
              productName: 'Nike Flex Control\n₹2500'),
          HomeGridView(
              imgPath: 'assets/images/adidas evolve.png',
              productName: 'Adidas Evolve Run\n₹1600'),
          HomeGridView(
              imgPath: 'assets/images/puma pacer.png',
              productName: 'Puma Pacer Prime\n1400'),
          HomeGridView(
              imgPath: 'assets/images/puma laceup.png',
              productName: 'Puma Lace_Up\n₹1300')
        ],
      ),
    );
  }
}
