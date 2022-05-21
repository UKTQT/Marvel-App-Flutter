import 'package:flutter/material.dart';

import 'extension/padding_extension.dart';
import 'view/comic_view.dart';
import 'view/character_view.dart';
import 'view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff121212),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xff121212),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainApp(),
        //'/characterView': (context) => const CharacterView(),
        //'/comicView': (context) => const ComicView(),
      },
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void bottomNavBarOnTap(int value) {
    setState(() {
      _pageController.animateToPage(value,
          duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(context),
      body: pages(),
      //bottomNavigationBar: bottomNavBar(),
    );
  }

  AppBar appBarCustom(BuildContext context) {
    return AppBar(
      elevation: 5,
      title: Image(
        image: const AssetImage(
          'lib/assets/images/marvel-logo.png',
        ),
        width: MediaQuery.of(context).size.width * 0.35,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: context.mediumWidthPadding2),
          child: const Icon(
            Icons.settings_outlined,
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  PageView pages() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: [
        HomeView(),
        Container(),
        Container(),
      ],
    );
  }

  /* BottomNavigationBar bottomNavBar() {
    return BottomNavigationBar(
      elevation: 5,
      onTap: (value) {
        bottomNavBarOnTap(value);
      },
      selectedIconTheme: const IconThemeData(
        color: Color(0xffED1D24),
        size: 30.0,
      ),
      unselectedIconTheme: const IconThemeData(color: Colors.white),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.sort_outlined), label: ''),
      ],
    );
  } */
}
