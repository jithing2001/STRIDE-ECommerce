import 'dart:developer';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/controllers/connectivity-controller.dart';
import 'package:ecommerce/model/brand_model.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/service/brand_service.dart';
import 'package:ecommerce/service/product_service.dart';
import 'package:ecommerce/view/home/widgets/homegridview.dart';
import 'package:ecommerce/view/popular_brands/popularbrands.dart';
import 'package:ecommerce/view/popular_brands/widgets/brand_wise.dart';
import 'package:ecommerce/view/productdetail/product_detail.dart';
import 'package:ecommerce/view/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce/view/settings/settings.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ConnectivityService connectivityService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!connectivityService.hasInternetConnection.value) {
        return connectivityService.showAlert(context);
      }
      return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(240, 249, 247, 247),
            elevation: 0,
            centerTitle: true,
            title: Text(
              'STRIDE',
              style: GoogleFonts.merriweather(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Get.to(const SettingsClass());
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.black,
                  ))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kheight10,
                const Text(
                  'Discover the Best..',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                kheight10,
                InkWell(
                  onTap: () => Get.to(SearchScreen()),
                  child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                        border: Border.all(color: kblack),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        kwidth10,
                        const Icon(Icons.search),
                        kwidth20,
                        const Text('Looking for shoes')
                      ],
                    ),
                  ),
                ),
                kheight10,
                const Text(
                  'Popular Brands',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                kheight10,
                SizedBox(
                  height: 70,
                  child: FutureBuilder(
                      future: BrandServices().fetchBrands(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          log('waiting');
                          return const CircularProgressIndicator();
                        }
                        final List<BrandModel> allBrandModel = snapshot.data!;
                        log(allBrandModel.length.toString());
                        return ListView.separated(
                          separatorBuilder: (context, index) => kwidth10,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            log('enter');
                            return InkWell(
                              onTap: () => Get.to(BrandWise(
                                  title: allBrandModel[index].category)),
                              child: PopularBrands(
                                imgpath: allBrandModel[index].image,
                                brandName: allBrandModel[index].category,
                              ),
                            );
                          },
                        );
                      }),
                ),
                kheight30,
                Expanded(
                    child: FutureBuilder(
                        future: ProductServices().fetchProducts(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.data == null) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final List<ProductModel> allProductModel =
                              snapshot.data!;

                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.9,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemBuilder: (context, index) {
                              // List<ProductModel> allProductModel = [];
                              // allProductModel.addAll(snapshot.data!.docs
                              //     .map((e) => ProductModel.fromJson(e.data())));
                              return InkWell(
                                onTap: () {
                                  Get.to(ProductDetailView(
                                    imgPath1:
                                        allProductModel[index].productImg1,
                                    imgPath2:
                                        allProductModel[index].productImg2,
                                    imgPath3:
                                        allProductModel[index].productImg3,
                                    productNames:
                                        allProductModel[index].productName,
                                    productDes:
                                        allProductModel[index].productDes,
                                    productRate:
                                        allProductModel[index].productPrice,
                                    sellingRate:
                                        allProductModel[index].discountPrice,
                                  ));
                                  log(index.toString());
                                },
                                child: HomeGridView(
                                  imgPath: allProductModel[index].productImg1,
                                  productName:
                                      allProductModel[index].productName,
                                  productRate:
                                      allProductModel[index].discountPrice,
                                ),
                              );
                            },
                            itemCount: allProductModel.length,
                          );
                        }))
              ],
            ),
          ));
    });
  }
}
