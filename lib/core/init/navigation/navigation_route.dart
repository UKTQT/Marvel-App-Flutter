import 'package:flutter/material.dart';
import 'package:marvel/features/home/comic/view/comic_view.dart';

import '../../../features/home/character/view/character_view.dart';
import '../../../features/home/home/view/home_view.dart';
import '../../../features/authenticate/splash/view/splash_view.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings path) {
    switch (path.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(
            widget: SplashView(), pageName: NavigationConstants.DEFAULT);
      case NavigationConstants.HOME_VIEW:
        return normalNavigate(
            widget: HomeView(), pageName: NavigationConstants.HOME_VIEW);
      case NavigationConstants.CHARACTER_VIEW:
        return argsNavigate(
            widget: CharacterView(),
            pageName: NavigationConstants.CHARACTER_VIEW,
            navigateArguments: path.arguments);
      case NavigationConstants.COMIC_VIEW:
        return argsNavigate(
            widget: ComicView(),
            pageName: NavigationConstants.COMIC_VIEW,
            navigateArguments: path.arguments);

      default:
        return MaterialPageRoute(builder: (context) => SplashView());
    }
  }

  MaterialPageRoute normalNavigate(
      {required Widget widget, required String pageName}) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: pageName),
    );
  }

  MaterialPageRoute argsNavigate(
      {required Widget widget,
      required String pageName,
      dynamic navigateArguments}) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: pageName, arguments: navigateArguments),
    );
  }
}
