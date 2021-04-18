import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
@singleton
class NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  void pop() {
    return _navigationKey.currentState?.pop();
  }

  Future<dynamic>? navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState?.pushNamed(routeName, arguments: arguments);
  }
}