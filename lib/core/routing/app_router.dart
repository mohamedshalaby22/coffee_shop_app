import 'package:coffee_shop_app/core/routing/routes.dart';
import 'package:coffee_shop_app/features/started/started_screen.dart';
import 'package:coffee_shop_app/screens/cart_page.dart';
import 'package:coffee_shop_app/features/home/ui/screens/home_screen.dart';
import 'package:coffee_shop_app/screens/home_layout.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case Routes.startedScreen:
        return MaterialPageRoute(builder: (_) => const StartedScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.homeLayoutScreen:
        return MaterialPageRoute(builder: (_) => const HomeLayoutPage());
      case Routes.cartScreen:
        return MaterialPageRoute(builder: (_) => const CartPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                body: Center(child: Text('No Route ${settings.name}'))));
    }
  }
}
