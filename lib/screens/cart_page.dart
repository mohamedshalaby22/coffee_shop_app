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
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppServices>(
      init: Get.put(AppServices()),
      builder: (appController) => Scaffold(
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
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              appController.canIncrease(index);
                                            },
                                            child: const Icon(
                                              Icons.add_circle_outline,
                                              color: Colors.brown,
                                              size: 25,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: SizedBox(
                                              width: 10,
                                              child: AppText(
                                                  fontSize: 16,
                                                  text:
                                                      '${appController.cartData[index].quantity}'),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              appController.canDecrease(index);
                                            },
                                            child: const Icon(
                                              Icons.remove_circle_outline,
                                              color: Colors.brown,
                                              size: 25,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          appController.deleteFromCart(
                                              appController.cartData[index],
                                              context);
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
              child: Row(
                children: [
                  const AppText(
                    text: 'Total Price:',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.brown,
                  ),
                  const Spacer(),
                  AppText(
                    text: '\$${appController.getTotalPrice()}',
                    color: Colors.brown,
                    fontSize: 17,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
