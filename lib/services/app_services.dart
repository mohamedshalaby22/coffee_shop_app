import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/snack_bar_widget.dart';
import '../models/coffee.dart';

class AppServices extends GetxController {
  List<Coffee> shopData = [
    Coffee(
      name: 'Coffee Latte',
      price: '4.10',
      imagePath: 'assets/images/coffee-latte.png',
    ),
    Coffee(
      name: 'Hot Tea',
      price: '3.50',
      imagePath: 'assets/images/hot-tea.png',
    ),
    Coffee(
      name: 'Expresso',
      price: '5.10',
      imagePath: 'assets/images/expresso.png',
    ),
    Coffee(
      name: 'Ice Coffee',
      price: '3.50',
      imagePath: 'assets/images/ice-coffee.png',
    ),
  ];
  List<Coffee> cartData = [];
  void addToCartData(Coffee coffee, context) {
    cartData.add(coffee);
    SnackBarWidget.showSnackBarWidget(
        context, '${coffee.name} Added To Cart Successfully!', Colors.brown);
    update();
  }

  void deleteFromCart(Coffee coffee, context) {
    cartData.remove(coffee);
    SnackBarWidget.showSnackBarWidget(context,
        '${coffee.name} Deleted From Cart Successfully!', Colors.brown);
    update();
  }
}
