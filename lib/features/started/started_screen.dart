import 'package:coffee_shop_app/core/components/app_text_button.dart';
import 'package:coffee_shop_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import '../../core/components/app_text.dart';
import '../../core/routing/routes.dart';

class StartedScreen extends StatefulWidget {
  const StartedScreen({Key? key}) : super(key: key);

  @override
  State<StartedScreen> createState() => _StartedScreenState();
}

class _StartedScreenState extends State<StartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: AppTextButton(
                buttonText: 'Enter Shop',
                onPressed: () {
                  context.pushNamed(Routes.homeLayoutScreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
