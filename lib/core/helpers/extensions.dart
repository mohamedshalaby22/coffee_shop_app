import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  /// Push to a named route
  Future<dynamic> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.pushNamed<T>(this, routeName, arguments: arguments);
  }

  /// Replace the current route with a named route
  Future<dynamic> pushReplacementNamed<T, TO>(String routeName,
      {Object? arguments}) {
    return Navigator.pushReplacementNamed<T, TO>(this, routeName,
        arguments: arguments);
  }

  /// Push a named route and remove all previous routes
  Future<dynamic> pushNamedAndRemoveUntil<T>(
    String routeName, {
    required RoutePredicate predicate,
    Object? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil<T>(this, routeName, predicate,
        arguments: arguments);
  }

  /// Pop the current route
  void pop() {
    return Navigator.pop(this);
  }

  /// Pop until a specific route
  void popUntil(String routeName) {
    Navigator.popUntil(this, ModalRoute.withName(routeName));
  }
}
