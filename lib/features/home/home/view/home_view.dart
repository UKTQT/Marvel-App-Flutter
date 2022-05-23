import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../viewModel/home_view_model.dart';
import '../../character/viewModel/character_view_model.dart';
import '../../series/viewModel/series_view_model.dart';
import '../../comic/viewModel/comic_view_model.dart';

import '../../../../core/extensions/padding_extension/padding_extension.dart';
//import '../extension/color_extension.dart';

import 'home_character.dart';
import 'home_comic.dart';
import 'home_search.dart';
import 'home_series.dart';

final HomeViewModel _homeViewModel = HomeViewModel();
final CharacterViewModel _characterViewModel = CharacterViewModel();
final SeriesViewModel _seriesViewModel = SeriesViewModel();
final ComicViewModel _comicViewModel = ComicViewModel();

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: context.highHeightPadding2),
          AspectRatio(
            aspectRatio: 16 / 2,
            child: HomeSearchWidget(homeViewModel: _homeViewModel),
          ),
          SizedBox(height: context.highHeightPadding2),
          AspectRatio(
            aspectRatio: 16 / 10,
            child: HomeCharacter(characterViewModel: _characterViewModel),
          ),
          SizedBox(height: context.mediumHeightPadding2),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: HomeSeries(seriesViewModel: _seriesViewModel),
          ),
          SizedBox(height: context.mediumHeightPadding2),
          AspectRatio(
            aspectRatio: 16 / 10,
            child: HomeComic(comicViewModel: _comicViewModel),
          ),
          SizedBox(height: context.highHeightPadding),
        ],
      ),
    );
  }
}
