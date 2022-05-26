import 'package:flutter/material.dart';
import 'package:marvel/features/authenticate/splash/view/splash_view.dart';

import 'core/constants/app/app_constants.dart';
import 'core/extensions/color_extension/color_extension.dart';
import 'core/init/navigation/navigation_service.dart';
import 'features/home/home/view/home_view.dart';
import 'features/home/character/view/character_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstant.instance!.PROJECT_TITLE,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: context.themeMainColor1,
        appBarTheme: AppBarTheme(
          backgroundColor: context.themeMainColor1,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: context.themeMainColor1,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashView(),
        '/homeView': (context) => HomeView(),
        '/characterView': (context) => const CharacterView(),
        //'/comicView': (context) => const ComicView(),
      },
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
