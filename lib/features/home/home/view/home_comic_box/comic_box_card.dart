import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app/app_constant.dart';
import '../../../../../core/extensions/padding_extension/padding_extension.dart';
import '../../../../../core/extensions/color_extension/color_extension.dart';
import '../../../comic/viewModel/comic_view_model.dart';

Padding comicCard(
    BuildContext context, ComicViewModel comicViewModel, int index) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/comicView', arguments: {
          'comicId': comicViewModel.comicItems![index].id,
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
            tag: '${comicViewModel.comicItems![index].id}',
            child: CachedNetworkImage(
              placeholder: (context, index) {
                return const CircularProgressIndicator(
                  color: Colors.white,
                );
              },
              imageUrl:
                  '${comicViewModel.comicItems![index].thumbnail!.path}.${comicViewModel.comicItems![index].thumbnail!.extension}',
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
