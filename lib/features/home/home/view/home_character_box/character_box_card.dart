import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app/app_constant.dart';
import '../../../../../core/extensions/padding_extension/padding_extension.dart';
import '../../../../../core/extensions/color_extension/color_extension.dart';
import '../../../character/viewModel/character_view_model.dart';

Padding characterCard(
    BuildContext context, CharacterViewModel characterViewModel, int index) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: context.lowWidthPadding,
        vertical: context.lowHeightPadding2),
    child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/characterView',
          arguments: characterNavigatorArguments(characterViewModel, index),
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
              child: characterImage(context, characterViewModel, index),
            ),
            Expanded(
              flex: 4,
              child: characterTitle(context, characterViewModel, index),
            ),
          ],
        ),
      ),
    ),
  );
}

Map<String, Object?> characterNavigatorArguments(
    CharacterViewModel characterViewModel, int index) {
  return {
    'characterId': characterViewModel.characterItems![index].id,
    'characterName': characterViewModel.characterItems![index].name,
    'characterDescription':
        characterViewModel.characterItems![index].description!.isEmpty
            ? 'Description not available'
            : characterViewModel.characterItems![index].description,
    'characterModified': characterViewModel.characterItems![index].modified,
    'characterPath': characterViewModel.characterItems![index].thumbnail?.path,
    'characterExt':
        characterViewModel.characterItems![index].thumbnail?.extension,
    'characterComics':
        characterViewModel.characterItems![index].comics?.collectionUri,
    'characterSeries':
        characterViewModel.characterItems![index].series?.collectionUri,
    'characterStories':
        characterViewModel.characterItems![index].stories?.collectionUri,
    'characterEvents':
        characterViewModel.characterItems![index].events?.collectionUri,
  };
}

SizedBox characterImage(
    BuildContext context, CharacterViewModel characterViewModel, int index) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.35,
    child: FittedBox(
      fit: BoxFit.fill,
      child: Hero(
        tag: '${characterViewModel.characterItems![index].id}',
        child: characterViewModel.characterItems![index].thumbnail != null
            ? CachedNetworkImage(
                imageUrl:
                    '${characterViewModel.characterItems![index].thumbnail?.path}.${characterViewModel.characterItems![index].thumbnail?.extension}',
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
    BuildContext context, CharacterViewModel characterViewModel, int index) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: context.lowWidthPadding2),
    child: SizedBox(
      width: double.maxFinite,
      child: Center(
        child: Text(
          characterViewModel.characterItems![index].name ?? '',
          style: Theme.of(context).textTheme.bodyText1,
          softWrap: false,
        ),
      ),
    ),
  );
}
