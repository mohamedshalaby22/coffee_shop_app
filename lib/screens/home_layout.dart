import 'package:coffee_shop_app/components/const.dart';
import 'package:coffee_shop_app/screens/home_shop_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'cart_page.dart';

class HomeLayoutPage extends StatefulWidget {
  const HomeLayoutPage({Key? key}) : super(key: key);

  @override
  State<HomeLayoutPage> createState() => _HomeLayoutPageState();
}

class _HomeLayoutPageState extends State<HomeLayoutPage> {
  List<Widget> pages = [
    const HomeShopPage(),
    const CartPage(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(25),
        child: GNav(
            backgroundColor: Constant.backgroundColor,
            color: Colors.grey[400],
            activeColor: Colors.grey[700],
            tabBorderRadius: 24,
            tabBackgroundColor: Colors.grey.shade300,
            tabActiveBorder: Border.all(color: Colors.white),
            mainAxisAlignment: MainAxisAlignment.center,
            onTabChange: (int value) {
              selectedIndex = value;
              setState(() {});
            },
            selectedIndex: selectedIndex,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Shop',
              ),
              GButton(
                icon: Icons.shopping_bag_outlined,
                text: 'Cart',
              ),
            ]),
      ),
      body: pages[selectedIndex],
    );
  }
}
