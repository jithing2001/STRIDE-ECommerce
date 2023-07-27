import 'package:ecommerce/constants.dart';
import 'package:ecommerce/controllers/search_controller.dart';
import 'package:ecommerce/view/home/widgets/homegridview.dart';
import 'package:ecommerce/view/productdetail/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  TextEditingController searchController = TextEditingController();
  SearchControllers searchC = Get.put(SearchControllers());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhite,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: kblack,
              )),
          title: TextFormField(
            controller: searchController,
            autofocus: true,
            onChanged: (value) async {
              await searchC.search(value);
            },
            decoration: const InputDecoration(hintText: 'Looking for shoes'),
          ),
          backgroundColor: kwhite,
          centerTitle: true,
          elevation: 1,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
          child: Obx(() {
            if (searchC.data.isEmpty) {
              return const Center(
                child: Text('No Products Found'),
              );
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: searchC.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(ProductDetailView(
                        imgPath1: searchC.data[index].productImg1,
                        imgPath2: searchC.data[index].productImg2,
                        imgPath3: searchC.data[index].productImg3,
                        productNames: searchC.data[index].productName,
                        productDes: searchC.data[index].productDes,
                        productRate: searchC.data[index].productPrice,
                        sellingRate: searchC.data[index].discountPrice,
                      ));
                    },
                    child: HomeGridView(
                      imgPath: searchC.data[index].productImg1,
                      productName: searchC.data[index].productName,
                      productRate: searchC.data[index].discountPrice,
                    ),
                  );
                },
              );
            }
          }),
        ));
  }
}
