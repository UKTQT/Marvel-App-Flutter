import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/extensions/color_extension/color_extension.dart';
import '../../viewModel/character_view_model.dart';

Observer characterViewComicBox(
    BuildContext context, CharacterViewModel _characterViewModel) {
  return Observer(builder: (_) {
    return _characterViewModel.characterComicsItems!.isEmpty
        ? CircularProgressIndicator(color: context.marvelRed)
        : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _characterViewModel.characterComicsItems?.length ?? 1,
            itemBuilder: (context, index) {
              return comicItem(context, _characterViewModel, index);
            });
  });
}

Padding comicItem(
    BuildContext context, CharacterViewModel _characterViewModel, int index) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: GestureDetector(
          onTap: () {
            /*  Navigator.pushNamed(context, '/comicView',
                                      arguments: {
                                        'comicId': ComicViewModel
                                            .comicItems!
                                            .elementAt(index)
                                            .id,
                                      }); */
          },
          child: Container(
              decoration: BoxDecoration(
                  color: context.whiteColor,
                  borderRadius: BorderRadius.circular(15.0)),
              width: MediaQuery.of(context).size.width * 0.35,
              child: FittedBox(
                  fit: BoxFit.fill,
                  child: CachedNetworkImage(
                      placeholder: (context, index) {
                        return CircularProgressIndicator(
                            color: context.whiteColor);
                      },
                      imageUrl:
                          '${_characterViewModel.characterComicsItems?[index].thumbnail?.path}.${_characterViewModel.characterComicsItems?[index].thumbnail?.extension}',
                      errorWidget: (context, url, error) =>
                          CircularProgressIndicator(
                              color: context.whiteColor))))));
}
