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
        Navigator.pushNamed(context, '/comicView', arguments: {
          'comicId': homeViewModel.comicItems![index].id,
          'comicTitle': homeViewModel.comicItems![index].title,
          'comicDescription':
              homeViewModel.comicItems![index].description!.isEmpty
                  ? 'Description not available'
                  : homeViewModel.comicItems![index].description,
          'comicModified': homeViewModel.comicItems![index].modified,
          'comicPrice': homeViewModel.comicItems![index].prices?[1].price,
          'comicPath': homeViewModel.comicItems![index].thumbnail?.path,
          'comicExt': homeViewModel.comicItems![index].thumbnail?.extension,
          'characterComics':
              homeViewModel.characterItems![index].comics?.collectionUri,
          'characterSeries':
              homeViewModel.characterItems![index].series?.collectionUri,
          'characterStories':
              homeViewModel.characterItems![index].stories?.collectionUri,
          'characterEvents':
              homeViewModel.characterItems![index].events?.collectionUri,
        });
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
              placeholder: (context, index) {
                return const CircularProgressIndicator(
                  color: Colors.white,
                );
              },
              imageUrl:
                  '${homeViewModel.comicItems![index].thumbnail!.path}.${homeViewModel.comicItems![index].thumbnail!.extension}',
              errorWidget: (context, url, error) =>
                  const CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
