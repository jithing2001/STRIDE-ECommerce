import 'package:ecommerce/controllers/bottom_nav_controller.dart';
import 'package:ecommerce/view/favorites/favorites.dart';
import 'package:ecommerce/view/home/homescreen.dart';
import 'package:ecommerce/view/mycart/mycart.dart';
import 'package:ecommerce/view/orders/orders.dart';
import 'package:ecommerce/view/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationClass extends StatelessWidget {
  BottomNavigationClass({Key? key});

  final NavController controller = Get.put(NavController());

  final List<Widget> pages = [
    const HomeScreen(),
    const MyOrders(),
    const MyCart(),
    const Favorites(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(
      builder: (navController) => Scaffold(
        body: pages[navController.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          selectedItemColor: const Color.fromARGB(255, 117, 97, 231),
          unselectedItemColor: Colors.black,
          currentIndex: navController.selectedIndex,
          onTap: (newIndex) {
            navController.changePage(newIndex);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.black),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag, color: Colors.black),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.black),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}