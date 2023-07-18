import 'dart:developer';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/service/cartservice.dart';
import 'package:ecommerce/service/favorite_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/productsize.dart';

class ProductDetailView extends StatefulWidget {
  String? imgPath;
  String? productNames;
  String? productDes;
  String? productRate;
  String? sellingRate;

  ProductDetailView({
    super.key,
    required this.imgPath,
    required this.productNames,
    required this.productDes,
    required this.productRate,
    required this.sellingRate,
  });

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  int? size;
  bool isFav = false;
  bool isCart = false;
     final currentemail = FirebaseAuth.instance.currentUser!.email;
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
              Icons.arrow_back,
              color: kblack,
            )),
        actions: [
          IconButton(
              onPressed: () async {
                ProductModel model = ProductModel(
                  productName: widget.productNames!,
                  productPrice: widget.productRate!,
                  discountPrice: widget.sellingRate!,
                  productDes: widget.productDes!,
                  productImg: widget.imgPath!,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kheight70,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 380,
                child: Image(
                  image: NetworkImage('${widget.imgPath}'),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          kheight20,
          Row(
            children: [
              kwidth25,
              Text(
                '${widget.productNames}',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              kwidth25,
              Text(
                '₹${widget.productRate}',
                style: const TextStyle(
                    fontSize: 30, decoration: TextDecoration.lineThrough),
              ),
              kwidth10,
              Text(
                '₹${widget.sellingRate}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
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
          Row(
            children: [
              kwidth30,
              InkWell(
                onTap: () {
                  size = 8;
                },
                child: ProductSize(
                  size: '8',
                ),
              ),
              kwidth10,
              InkWell(
                onTap: () => size = 9,
                child: ProductSize(
                  size: '9',
                ),
              ),
              kwidth10,
              InkWell(
                onTap: () => size = 10,
                child: ProductSize(
                  size: '10',
                ),
              ),
              kwidth10,
              InkWell(
                onTap: () => size = 11,
                child: ProductSize(
                  size: '11',
                ),
              ),
            ],
          ),
          kheight30,
          Center(
            child: SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                  onPressed: () async {
                    CartModel model = CartModel(
                        discountPrice: widget.sellingRate!,
                        productDes: widget.productDes!,
                        productImg: widget.imgPath!,
                        productName: widget.productNames!,
                        productSize: size.toString(),
                        currentUser: currentemail.toString());

                    await checkCartStatus();

                    isCart
                        ? await CartService().removeCart(product: model)
                        : await CartService().addCart(product: model);
                  },
                  child:
                      isCart ? Text('Remove from Cart') : Text('Add to Cart')),
            ),
          )
        ],
      ),
    );
  }

  checkFavoriteStatus() async {
    final isFavoriteProduct = await FavoriteService().checkFav(
        product: ProductModel(
            productName: widget.productNames!,
            productPrice: widget.productRate!,
            discountPrice: widget.sellingRate!,
            productDes: widget.productDes!,
            productImg: widget.imgPath!));
    setState(() {
      isFav = isFavoriteProduct;
    });
  }

  checkCartStatus() async {
    final isCartProduct = await CartService().checkcart(
        product: CartModel(
            productName: widget.productNames!,
            productDes: widget.productDes!,
            productSize: size.toString(),
            discountPrice: widget.sellingRate!,
            productImg: widget.imgPath!,currentUser: currentemail.toString()));
    setState(() {
      isCart = isCartProduct;
      log(isCart.toString());
    });
  }
}
