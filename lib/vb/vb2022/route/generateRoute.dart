import 'package:flutter/material.dart';

import '../../../view/home_view.dart';

class NavigatorCustom {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name == '/') {
      _navigaterToNormal(HomeView());
    }
    return null;
  }

  Route<dynamic>? _navigaterToNormal(Widget child) {
    return MaterialPageRoute(
      fullscreenDialog: false, // ekranın popup şeklinde açılması
      builder: (context) {
        return child;
      },
    );
  }
}
