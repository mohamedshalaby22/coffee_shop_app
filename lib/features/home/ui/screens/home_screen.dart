import 'package:coffee_shop_app/core/theming/colors.dart';
import 'package:coffee_shop_app/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/components/app_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppServices appController = Get.put(AppServices());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const AppText(
                  text: 'How Would You Like Your Coffee?',
                  fontSize: 17,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 30,
                ),
                ...List.generate(
                    appController.shopData.length,
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
                                appController.shopData[index].imagePath,
                                width: 55,
                                height: 55,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                      text: appController.shopData[index].name),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  AppText(
                                    text:
                                        '\$${appController.shopData[index].price}',
                                    color: Colors.brown[200]!,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  appController.addToCartData(
                                      appController.shopData[index], context);
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.brown[200],
                                ),
                              ),
                            ],
                          ),
                        ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
