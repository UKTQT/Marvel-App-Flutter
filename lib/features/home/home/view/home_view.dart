import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/extensions/color_extension/color_extension.dart';
import '../../../../core/extensions/padding_extension/padding_extension.dart';
import '../viewModel/home_view_model.dart';
import 'home_character_box/home_character_box.dart';
import 'home_comic_box/home_comic_box.dart';
import 'home_search.dart';
import 'home_series.dart';

class HomeView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeViewModel _homeViewModel) {
        return Scaffold(
          appBar: appBarCustom(context),
          //bottomNavigationBar: bottomNavBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: context.highHeightPadding2),
                AspectRatio(
                  aspectRatio: 16 / 2,
                  child: homeSearch(
                      context: context, homeViewModel: _homeViewModel),
                ),
                SizedBox(height: context.highHeightPadding2),
                Observer(
                  builder: (_) {
                    return _homeViewModel.searchItems.isNotEmpty
                        ? const Text('Search View')
                        : Column(
                            children: [
                              AspectRatio(
                                aspectRatio: 16 / 10,
                                child: homeCharacter(
                                    context: context,
                                    homeViewModel: _homeViewModel),
                              ),
                              SizedBox(height: context.mediumHeightPadding2),
                              AspectRatio(
                                aspectRatio: 16 / 10,
                                child: homeComic(
                                    context: context,
                                    homeViewModel: _homeViewModel),
                              ),
                              SizedBox(height: context.mediumHeightPadding2),
                              AspectRatio(
                                aspectRatio: 16 / 9,
                                child: homeSeries(
                                    context: context,
                                    homeViewModel: _homeViewModel),
                              ),
                            ],
                          );
                  },
                ),
                SizedBox(height: context.highHeightPadding),
              ],
            ),
          ),
        );
      },
    );
  }

  AppBar appBarCustom(BuildContext context) {
    return AppBar(
      elevation: 5,
      title: Image(
        image: AssetImage(
          AppConstant.instance!.PROJECT_LOGO_PATH,
        ),
        width: MediaQuery.of(context).size.width * 0.35,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: context.mediumWidthPadding2),
          child: Icon(
            Icons.settings_outlined,
            color: context.marvelRed,
          ),
        ),
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
