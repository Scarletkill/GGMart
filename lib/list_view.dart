import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gg_mart/Controller/counter_controller.dart';
import 'package:gg_mart/Model/list_model.dart';
import 'package:gg_mart/search.dart';
import 'Favorite.dart';
import 'Home.dart';
import 'Wishlist.dart';
import 'login.dart';

class ListviewScreen extends StatefulWidget {
  const ListviewScreen({super.key});

  @override
  State<ListviewScreen> createState() => _ListviewScreenState();
}

class _ListviewScreenState extends State<ListviewScreen> {
  int _currentIndex = 0;

  final pages =[
    Searchbar(),
    search(),
    Favorite(),
    wishlist(),
    Login()
  ];
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    ///Dependency Injection for creating objects

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightGreen[300],
        onTap: (index) => {
          setState(() {
            _currentIndex = index;
          }),
        },
        currentIndex: _currentIndex,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "wishlist"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
        selectedItemColor: Colors.lightGreen.shade400,
        unselectedItemColor: Colors.black,
      ),
      body: pages.elementAt(_currentIndex)
    );
  }
}
