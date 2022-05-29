import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/extensions/padding_extension/padding_extension.dart';
import '../../../../../core/extensions/color_extension/color_extension.dart';
import '../../viewModel/home_view_model.dart';

Padding comicCard(
    {required BuildContext context,
    required HomeViewModel homeViewModel,
    required int index}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/comicView',
            arguments: comicNavigatorArguments(homeViewModel, index));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        width: MediaQuery.of(context).size.width * 0.35,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Hero(
            tag: '${homeViewModel.comicItems![index].id}',
            child: CachedNetworkImage(
              imageUrl:
                  '${homeViewModel.comicItems![index].thumbnail!.path}.${homeViewModel.comicItems![index].thumbnail!.extension}',
              placeholder: (context, url) => const Placeholder(),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, color: context.marvelRed),
            ),
          ),
        ),
      ),
    ),
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
