import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/snack_bar_widget.dart';
import '../models/coffee.dart';

class AppServices extends GetxController {
  List<Coffee> shopData = [
    Coffee(
      id: 1,
      name: 'Coffee Latte',
      price: '4.10',
      imagePath: 'assets/images/coffee-latte.png',
    ),
    Coffee(
      id: 2,
      name: 'Hot Tea',
      price: '3.50',
      imagePath: 'assets/images/hot-tea.png',
    ),
    Coffee(
      id: 3,
      name: 'Expresso',
      price: '5.10',
      imagePath: 'assets/images/expresso.png',
    ),
    Coffee(
      id: 4,
      name: 'Ice Coffee',
      price: '3.50',
      imagePath: 'assets/images/ice-coffee.png',
    ),
  ];
  List<Coffee> cartData = [];
  void addToCartData(
    Coffee coffee,
    context,
  ) {
    if (cartData.where((element) => element.id == coffee.id).isNotEmpty) {
      coffee.quantity++;
    } else {
      cartData.add(coffee);
    }

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

  double getTotalPrice() {
    double totalPrices = 0.0;
    for (int i = 0; i < cartData.length; i++) {
      totalPrices += cartData[i].quantity * double.parse(cartData[i].price);
    }

    return totalPrices.toPrecision(3);
  }

  void canIncrease(index) {
    if (cartData[index].quantity < 9) {
      cartData[index].quantity++;
    }
    update();
  }

  void canDecrease(index) {
    if (cartData[index].quantity == 1) {
      cartData.removeAt(index);
    } else {
      if (cartData[index].quantity > 0) {
        cartData[index].quantity--;
      }
    }

    update();
  }
}
