import 'package:flutter/cupertino.dart';

class NavigatorManager {
  NavigatorManager._();
  static NavigatorManager instance = NavigatorManager._();

  final GlobalKey<NavigatorState> _navigatorGlobalKey = GlobalKey();

  GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;

  /* void pushToPage(NavigateRoutes navigateRoutes, {Object? arguments}){
    _navigatorGlobalKey.currentState?.pushNamed();
  } */
}