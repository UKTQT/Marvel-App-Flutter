import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../features/home/home/viewModel/home_view_model.dart';
import '../../extensions/color_extension/color_extension.dart';
import '../../extensions/padding_extension/padding_extension.dart';

Observer deneme(HomeViewModel _viewModel, BuildContext context) {
  return Observer(
    builder: (_) {
      return _viewModel.comicItemsIsLoading
          ? Center(
              child: CircularProgressIndicator(
                color: context.marvelRed,
              ),
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _viewModel.comicItems!.isNotEmpty ? 20 : 0,
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
                        arguments: comicNavigatorArguments(_viewModel, index),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                          /* border: Border.all(
              color: Colors.black26,
              width: 2,
            ), */
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0)),
                          color: context.characterBoxCardColor),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 9,
                            child: characterImage(
                                context: context,
                                homeViewModel: _viewModel,
                                index: index),
                          ),
                          Expanded(
                            flex: 4,
                            child: characterTitle(
                                context: context,
                                homeViewModel: _viewModel,
                                index: index),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
    },
  );
}

Map<String, dynamic> comicNavigatorArguments(
    HomeViewModel homeViewModel, int index) {
  return {
    'comicId': homeViewModel.comicItems![index].id,
    'comicTitle': homeViewModel.comicItems![index].title,
    'comicDescription': homeViewModel.comicItems![index].description == '' ||
            homeViewModel.comicItems![index].description == null
        ? 'Description not available'
        : homeViewModel.comicItems![index].description,
    'comicModified': homeViewModel.comicItems![index].modified,
    'comicPrice': homeViewModel.comicItems![index].prices![0].price,
    'comicPath': homeViewModel.comicItems![index].thumbnail?.path,
    'comicExt': homeViewModel.comicItems![index].thumbnail?.extension,
    'comicDetail': homeViewModel.comicItems![index].urls?[0].url,
    'comicSeries': homeViewModel.comicItems![index].series!.resourceUri,
    'comicCreators': homeViewModel.comicItems![index].creators?.collectionUri,
    'comicCharacters':
        homeViewModel.comicItems![index].characters?.collectionUri,
    'comicStories': homeViewModel.comicItems![index].stories?.collectionUri,
    'comicEvents': homeViewModel.comicItems![index].events?.collectionUri,
  };
}

SizedBox characterImage(
    {required BuildContext context,
    required HomeViewModel homeViewModel,
    required int index}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.35,
    child: FittedBox(
      fit: BoxFit.fill,
      child: Hero(
        tag: '${homeViewModel.characterItems![index].id}',
        child: homeViewModel.characterItems![index].thumbnail != null
            ? CachedNetworkImage(
                imageUrl:
                    '${homeViewModel.characterItems![index].thumbnail?.path}.${homeViewModel.characterItems![index].thumbnail?.extension}',
                placeholder: (context, url) => const Placeholder(),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error, color: context.marvelRed),
              )
            : const CircularProgressIndicator(),
      ),
    ),
  );
}

Padding characterTitle(
    {required BuildContext context,
    required HomeViewModel homeViewModel,
    required int index}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: context.lowWidthPadding2),
    child: SizedBox(
      width: double.maxFinite,
      child: Center(
        child: Text(
          homeViewModel.characterItems![index].name ?? '',
          style: Theme.of(context).textTheme.bodyText1,
          softWrap: false,
        ),
      ),
    ),
  );
}
