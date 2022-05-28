import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/extensions/padding_extension/padding_extension.dart';
import '../../../../../core/extensions/color_extension/color_extension.dart';
import '../../viewModel/character_view_model.dart';

Observer characterViewComicBox(CharacterViewModel _characterViewModel) {
  return Observer(
    builder: (_) {
      return _characterViewModel.characterComicsItems!.isEmpty
          ? const CircularProgressIndicator(
              color: Colors.red,
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _characterViewModel.characterComicsItems?.length ?? 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: CachedNetworkImage(
                          placeholder: (context, index) {
                            return const CircularProgressIndicator(
                              color: Colors.white,
                            );
                          },
                          imageUrl:
                              '${_characterViewModel.characterComicsItems?[index].thumbnail?.path}.${_characterViewModel.characterComicsItems?[index].thumbnail?.extension}',
                          errorWidget: (context, url, error) =>
                              const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
    },
  );
}
