import 'dart:developer';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/controllers/size_controller.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/model/fav_model.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/service/cartservice.dart';
import 'package:ecommerce/service/favorite_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/productsize.dart';

class ProductDetailView extends StatefulWidget {
  String? imgPath1;
  String? imgPath2;
  String? imgPath3;
  String? productNames;
  String? productDes;
  String? productRate;
  String? sellingRate;

  ProductDetailView({
    super.key,
    required this.imgPath1,
    required this.imgPath2,
    required this.imgPath3,
    required this.productNames,
    required this.productDes,
    required this.productRate,
    required this.sellingRate,
  });

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

SizeController sizeObj = SizeController();

class _ProductDetailViewState extends State<ProductDetailView> {
  bool isFav = false;
  bool isCart = false;
  bool isSelected = false;
  final listSize = [
    '8',
    '9',
    '10',
    '11',
    '12',
  ];
  final currentemail = FirebaseAuth.instance.currentUser!.email;
  String size = '8';
  @override
  Widget build(BuildContext context) {
    checkFavoriteStatus();
    checkCartStatus();

    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: kblack,
            )),
        actions: [
          IconButton(
              onPressed: () async {
                favModel model = favModel(
                  currentUser: currentemail!,
                  productSize: size,
                  productName: widget.productNames!,
                  productPrice: widget.productRate!,
                  discountPrice: widget.sellingRate!,
                  productDes: widget.productDes!,
                  productImg1: widget.imgPath1!,
                  productImg2: widget.imgPath2!,
                  productImg3: widget.imgPath3!,
                );
                await checkFavoriteStatus();

                isFav
                    ? await FavoriteService().removeFavorite(product: model)
                    : await FavoriteService().addFavorite(product: model);
              },
              icon: Icon(
                Icons.favorite,
                color: isFav ? kred : kblack,
                size: 30,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kheight30,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 310,
                    width: 380,
                    child: AnotherCarousel(
                      images: [
                        NetworkImage('${widget.imgPath1}'),
                        NetworkImage('${widget.imgPath2}'),
                        NetworkImage('${widget.imgPath3}'),
                      ],
                    )),
              ],
            ),
            kheight20,
            Row(
              children: [
                kwidth25,
                SizedBox(
                  width: 350,
                  child: Text(
                    '${widget.productNames}',
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                kwidth25,
                Text(
                  '₹${widget.productRate}',
                  style: TextStyle(
                      fontSize: 25,
                      decoration: TextDecoration.lineThrough,
                      color: kred),
                ),
                kwidth10,
                Text(
                  '₹${widget.sellingRate}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30, color: kgreen),
                )
              ],
            ),
            kheight20,
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text('${widget.productDes}'),
            ),
            kheight30,
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Size',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            kheight10,
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Obx(() => InkWell(
                        onTap: () {
                          sizeObj.sizeSelected(index);
                          size = listSize[index];
                        },
                        child: Row(
                          children: [
                            ProductSize(
                              color: sizeObj.selectedindex.value == index
                                  ? kblack
                                  : kgrey,
                              textcolor: sizeObj.selectedindex.value == index
                                  ? kwhite
                                  : kblack,
                              size: listSize[index],
                            ),
                            kwidth10,
                          ],
                        ),
                      )),
                  itemCount: listSize.length,
                ),
              ),
            ),
            kheight10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: kblack,
                  child: IconButton(
                      onPressed: () async {
                        CartModel model = CartModel(
                            discountPrice: widget.sellingRate!,
                            productDes: widget.productDes!,
                            productImg1: widget.imgPath1!,
                            productImg2: widget.imgPath2!,
                            productImg3: widget.imgPath3!,
                            productName: widget.productNames!,
                            productSize: size.toString(),
                            currentUser: currentemail.toString());

                        await checkCartStatus();

                        isCart
                            ? await CartService().removeCart(product: model)
                            : await CartService().addCart(product: model);
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: isCart ? kred : kwhite,
                      )),
                ),
              ],
            ),
            kheight20
          ],
        ),
      ),
    );
  }

  checkFavoriteStatus() async {
    final isFavoriteProduct = await FavoriteService().checkFav(
        product: favModel(
      productSize: size,
      currentUser: currentemail!,
      productName: widget.productNames!,
      productPrice: widget.productRate!,
      discountPrice: widget.sellingRate!,
      productDes: widget.productDes!,
      productImg1: widget.imgPath1!,
      productImg2: widget.imgPath2!,
      productImg3: widget.imgPath3!,
    ));
    setState(() {
      isFav = isFavoriteProduct;
    });
  }

  checkCartStatus() async {
    final isCartProduct = await CartService().checkcart(
        product: CartModel(
            productName: widget.productNames!,
            productDes: widget.productDes!,
            productSize: size,
            discountPrice: widget.sellingRate!,
            productImg1: widget.imgPath1!,
            productImg2: widget.imgPath2!,
            productImg3: widget.imgPath3!,
            currentUser: currentemail.toString()));
    setState(() {
      isCart = isCartProduct;
      log(isCart.toString());
    });
  }
}
