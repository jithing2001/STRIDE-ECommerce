import 'package:ecommerce/constants.dart';
import 'package:ecommerce/controllers/bottom_nav_controller.dart';
import 'package:ecommerce/view/favorites/favorites.dart';
import 'package:ecommerce/view/home/homescreen.dart';
import 'package:ecommerce/view/mycart/mycart.dart';
import 'package:ecommerce/view/orders/orders.dart';
import 'package:ecommerce/view/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationClass extends StatelessWidget {
  BottomNavigationClass({super.key});

  final NavController controller = Get.put(NavController());

  final List<Widget> pages = [
    HomeScreen(),
    const MyOrders(),
    MyCart(),
    Favorites(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(
      builder: (navController) => Scaffold(
        body: pages[navController.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          selectedItemColor: Colors.blue,
          showSelectedLabels: true,
          unselectedItemColor: Colors.black,
          selectedIconTheme: IconThemeData(color: kblue),
          currentIndex: navController.selectedIndex,
          onTap: (newIndex) {
            navController.changePage(newIndex);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Orders'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: 'Cart'),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
