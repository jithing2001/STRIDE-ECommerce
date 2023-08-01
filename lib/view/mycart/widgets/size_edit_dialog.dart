import 'package:ecommerce/constants.dart';
import 'package:ecommerce/controllers/cart_size_controller.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeEdit extends StatelessWidget {
  const SizeEdit({
    Key? key,
    required this.cartSizeController,
    required this.product,
  }) : super(key: key);

  final CartSizeController cartSizeController;
  final CartModel product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 100,
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Edit Product Size',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          kheight20,
          Container(
            height: 25,
            width: 80,
            decoration: BoxDecoration(
              border: Border.all(color: kblack),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async {
                    await cartSizeController.removeSize(product: product);
                  },
                  child: Icon(
                    Icons.remove,
                    color: kred,
                  ),
                ),
                GetBuilder<CartSizeController>(
                  init: cartSizeController,
                  builder: (controller) {
                    return Text(
                      ' ${controller.sizeEdit ?? product.productSize}',
                      style: TextStyle(color: kblack),
                    );
                  },
                ),
                InkWell(
                  onTap: () async {
                    await cartSizeController.addSize(product: product);
                  },
                  child: Icon(
                    Icons.add,
                    color: kgreen,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
