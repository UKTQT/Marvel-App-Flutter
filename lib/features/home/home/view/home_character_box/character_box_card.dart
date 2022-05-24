import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel/features/home/home/viewModel/home_view_model.dart';

import '../../../../../core/constants/app/app_constant.dart';
import '../../../../../core/extensions/padding_extension/padding_extension.dart';
import '../../../../../core/extensions/color_extension/color_extension.dart';
import '../../../character/viewModel/character_view_model.dart';

Padding characterCard(
    {required BuildContext context,
    required HomeViewModel homeViewModel,
    required int index}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: context.lowWidthPadding,
        vertical: context.lowHeightPadding2),
    child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/characterView',
          arguments: characterNavigatorArguments(homeViewModel, index),
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
                  context: context, homeViewModel: homeViewModel, index: index),
            ),
            Expanded(
              flex: 4,
              child: characterTitle(
                  context: context, homeViewModel: homeViewModel, index: index),
            ),
          ],
        ),
      ),
    ),
  );
}

Map<String, Object?> characterNavigatorArguments(
    HomeViewModel homeViewModel, int index) {
  return {
    'characterId': homeViewModel.characterItems![index].id,
    'characterName': homeViewModel.characterItems![index].name,
    'characterDescription':
        homeViewModel.characterItems![index].description!.isEmpty
            ? 'Description not available'
            : homeViewModel.characterItems![index].description,
    'characterModified': homeViewModel.characterItems![index].modified,
    'characterPath': homeViewModel.characterItems![index].thumbnail?.path,
    'characterExt': homeViewModel.characterItems![index].thumbnail?.extension,
    'characterComics':
        homeViewModel.characterItems![index].comics?.collectionUri,
    'characterSeries':
        homeViewModel.characterItems![index].series?.collectionUri,
    'characterStories':
        homeViewModel.characterItems![index].stories?.collectionUri,
    'characterEvents':
        homeViewModel.characterItems![index].events?.collectionUri,
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
