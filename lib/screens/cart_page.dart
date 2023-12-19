import 'package:coffee_shop_app/components/const.dart';
import 'package:coffee_shop_app/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/app_btn.dart';
import '../components/app_text.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  AppServices appController = Get.put(AppServices());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                const AppText(
                  text: ' Your Cart',
                  fontSize: 17,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 30,
                ),
                Visibility(
                  visible: appController.cartData.isNotEmpty,
                  replacement: const Padding(
                    padding: EdgeInsets.only(top: 300),
                    child: AppText(
                      text: 'No Items Available',
                    ),
                  ),
                  child: Column(
                    children: [
                      ...List.generate(
                          appController.cartData.length,
                          (index) => Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                width: double.infinity,
                                padding: const EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      appController.cartData[index].imagePath,
                                      width: 55,
                                      height: 55,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                            text: appController
                                                .cartData[index].name),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        AppText(
                                          text:
                                              '\$${appController.cartData[index].price}',
                                          color: Colors.brown[200]!,
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        appController.deleteFromCart(
                                            appController.cartData[index],
                                            context);
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.brown[200],
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: appController.cartData.isNotEmpty,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: AppButton(
            text: 'Pay Now',
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
