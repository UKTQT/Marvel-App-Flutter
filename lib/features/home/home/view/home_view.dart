import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel/core/base/view/base_view.dart';

import '../viewModel/home_view_model.dart';
import '../../character/viewModel/character_view_model.dart';
import '../../series/viewModel/series_view_model.dart';
import '../../comic/viewModel/comic_view_model.dart';

import '../../../../core/extensions/padding_extension/padding_extension.dart';

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
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: context.highHeightPadding2),
              AspectRatio(
                aspectRatio: 16 / 2,
                child:
                    homeSearch(context: context, homeViewModel: _homeViewModel),
              ),
              SizedBox(height: context.highHeightPadding2),
              Observer(
                builder: (_) {
                  return _homeViewModel.searchItems.isNotEmpty
                      ? const Text('ewq')
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
        );
      },
    );
  }
}








/* class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _homeViewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return 
  }
} */

/*
SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: context.highHeightPadding2),
          AspectRatio(
            aspectRatio: 16 / 2,
            child: homeSearch(context: context, homeViewModel: _homeViewModel),
          ),
          SizedBox(height: context.highHeightPadding2),
          Observer(
            builder: (_) {
              return _homeViewModel.searchItems.isNotEmpty
                  ? const Text('ewq')
                  : Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 10,
                          child: homeCharacter(
                              context: context, homeViewModel: _homeViewModel),
                        ),
                        SizedBox(height: context.mediumHeightPadding2),
                        AspectRatio(
                          aspectRatio: 16 / 10,
                          child: homeComic(
                              context: context, homeViewModel: _homeViewModel),
                        ),
                        SizedBox(height: context.mediumHeightPadding2),
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: homeSeries(
                              context: context, homeViewModel: _homeViewModel),
                        ),
                      ],
                    );
            },
          ),
          SizedBox(height: context.highHeightPadding),
        ],
      ),
    );


*/