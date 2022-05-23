import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel/features/home/comic/view/comic_view.dart';

import '../../../../extension/padding_extension.dart';
//import '../extension/color_extension.dart';
import '../../character/viewModel/character_view_model.dart';
import '../../comic/viewModel/comic_view_model.dart';
import '../viewModel/home_view_model.dart';
import '../../series/viewModel/series_view_model.dart';

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
  // late HomeViewModel _homeViewModel;
  // late CharacterViewModel _characterViewModel;
  //late ComicViewModel _comicViewModel;
  //late SeriesViewModel _seriesViewModel;

  /* fetchItems() async {
    await _characterViewModel.fetchCharacterItems();
    await _seriesViewModel.fetchSeriesItems();
    await _comicViewModel.fetchComicItems();
  } */

  @override
  void initState() {
    /*  _homeViewModel = HomeViewModel(); */

    /* _characterViewModel = CharacterViewModel();
    _characterViewModel.fetchCharacterItems(); */

    /*  _seriesViewModel = SeriesViewModel();
    _seriesViewModel.fetchSeriesItems(); */

    /* _comicViewModel = ComicViewModel();
    _comicViewModel.fetchComicItems(); */
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: context.highHeightPadding2),
          AspectRatio(
            aspectRatio: 16 / 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                onChanged: (String searchValue) {
                  Future.delayed(const Duration(milliseconds: 500), () {
                    _homeViewModel.searchItems = searchValue;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Characters, Comics, Series....',
                  labelStyle: TextStyle(color: Colors.white60),
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: context.highHeightPadding2),
          AspectRatio(
            aspectRatio: 16 / 10,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.mediumWidthPadding2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Characters',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'All Rnd 100 Characters >>',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Observer(
                  builder: (_) {
                    return !_characterViewModel.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                _characterViewModel.characterItems!.isNotEmpty
                                    ? 20
                                    : 0,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: context.lowWidthPadding,
                                    vertical: context.lowHeightPadding2),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/characterView',
                                      arguments: {
                                        'characterId': _characterViewModel
                                            .characterItems![index].id,
                                        'characterName': _characterViewModel
                                            .characterItems![index].name,
                                        'characterDescription':
                                            _characterViewModel
                                                    .characterItems![index]
                                                    .description!
                                                    .isEmpty
                                                ? 'Description not available'
                                                : _characterViewModel
                                                    .characterItems![index]
                                                    .description,
                                        'characterModified': _characterViewModel
                                            .characterItems![index].modified,
                                        'characterPath': _characterViewModel
                                            .characterItems![index]
                                            .thumbnail
                                            ?.path,
                                        'characterExt': _characterViewModel
                                            .characterItems![index]
                                            .thumbnail
                                            ?.extension,
                                        'characterComics': _characterViewModel
                                            .characterItems![index]
                                            .comics
                                            ?.collectionUri,
                                        'characterSeries': _characterViewModel
                                            .characterItems![index]
                                            .series
                                            ?.collectionUri,
                                        'characterStories': _characterViewModel
                                            .characterItems![index]
                                            .stories
                                            ?.collectionUri,
                                        'characterEvents': _characterViewModel
                                            .characterItems![index]
                                            .events
                                            ?.collectionUri,
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black26,
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(15.0),
                                          bottomRight: Radius.circular(15.0),
                                        ),
                                        color: Color(0xff202020)),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 9,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35,
                                            child: FittedBox(
                                              fit: BoxFit.fill,
                                              child: Hero(
                                                tag:
                                                    '${_characterViewModel.characterItems![index].id}',
                                                child: _characterViewModel
                                                            .characterItems![
                                                                index]
                                                            .thumbnail !=
                                                        null
                                                    ? CachedNetworkImage(
                                                        imageUrl:
                                                            '${_characterViewModel.characterItems![index].thumbnail?.path}.${_characterViewModel.characterItems![index].thumbnail?.extension}',
                                                        placeholder: (context,
                                                                url) =>
                                                            const CircularProgressIndicator(
                                                          color: Colors.red,
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            const Icon(
                                                                Icons.error),
                                                      )
                                                    : CircularProgressIndicator(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    context.lowWidthPadding2),
                                            child: Container(
                                              width: double.maxFinite,
                                              child: Center(
                                                child: Text(
                                                  _characterViewModel
                                                          .characterItems![
                                                              index]
                                                          .name ??
                                                      '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                          color: Colors.white),
                                                  softWrap: false,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                  },
                )),
              ],
            ),
          ),
          SizedBox(height: context.mediumHeightPadding2),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.mediumWidthPadding2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Series',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'All Series >>',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Observer(
                    builder: (_) {
                      return !_seriesViewModel.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.red,
                              ),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  _seriesViewModel.seriesItems!.isNotEmpty
                                      ? 20
                                      : 0,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      // borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: CachedNetworkImage(
                                        placeholder: (context, index) {
                                          return const CircularProgressIndicator(
                                            color: Colors.white,
                                          );
                                        },
                                        imageUrl:
                                            '${_seriesViewModel.seriesItems![index].thumbnail!.path}.${_seriesViewModel.seriesItems![index].thumbnail!.extension}',
                                        errorWidget: (context, url, error) =>
                                            const CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: context.mediumHeightPadding2),
          AspectRatio(
            aspectRatio: 16 / 10,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.mediumWidthPadding2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Comics',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'All Comics >>',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Observer(
                    builder: (_) {
                      return !_comicViewModel.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.red,
                              ),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _comicViewModel.comicItems!.isNotEmpty
                                  ? 20
                                  : 0,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/comicView',
                                          arguments: {
                                            'comicId': _comicViewModel
                                                .comicItems![index].id,
                                          });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Hero(
                                          tag:
                                              '${_comicViewModel.comicItems![index].id}',
                                          child: CachedNetworkImage(
                                            placeholder: (context, index) {
                                              return const CircularProgressIndicator(
                                                color: Colors.white,
                                              );
                                            },
                                            imageUrl:
                                                '${_comicViewModel.comicItems![index].thumbnail!.path}.${_comicViewModel.comicItems![index].thumbnail!.extension}',
                                            errorWidget: (context, url,
                                                    error) =>
                                                const CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: context.highHeightPadding),
        ],
      ),
    );
  }
}
