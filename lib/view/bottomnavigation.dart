import 'package:ecommerce/view/favorites/favorites.dart';
import 'package:ecommerce/view/home/homescreen.dart';
import 'package:ecommerce/view/mycart/mycart.dart';
import 'package:ecommerce/view/orders/orders.dart';
import 'package:ecommerce/view/profile/profile.dart';
import 'package:flutter/material.dart';

class BottomNavigationClass extends StatefulWidget {
  const BottomNavigationClass({super.key});

  @override
  State<BottomNavigationClass> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigationClass> {
  int currentSelectedIndex = 0;

  final pages = [
    const HomeScreen(),
    const MyOrders(),
    const MyCart(),
    const Favorites(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          // showUnselectedLabels: true,
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          selectedItemColor: const Color.fromARGB(255, 117, 97, 231),
          unselectedItemColor: Colors.black,
          currentIndex: currentSelectedIndex,
          onTap: (newIndex) {
            setState(() {
              currentSelectedIndex = newIndex;
            });
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
                label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite, color: Colors.black),
                label: 'Favourites'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.black), label: 'person'),
          ]),
    );
  }
}
