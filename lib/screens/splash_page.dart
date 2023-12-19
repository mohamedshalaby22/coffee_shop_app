import 'package:coffee_shop_app/components/app_btn.dart';
import 'package:coffee_shop_app/components/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/const.dart';
import 'home_layout.dart';
import 'home_shop_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/hot-coffee.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 50,
            ),
            const AppText(
              text: 'Brew Day',
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(
              height: 20,
            ),
            const AppText(
              text: 'How Do You Like Your Coffee',
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: AppButton(
                text: 'Enter Shop',
                onTap: () {
                  Get.to(() => const HomeLayoutPage(),
                      transition: Transition.leftToRight);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
