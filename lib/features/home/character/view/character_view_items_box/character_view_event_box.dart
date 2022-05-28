import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/extensions/padding_extension/padding_extension.dart';
import '../../../../../core/extensions/color_extension/color_extension.dart';
import '../../viewModel/character_view_model.dart';

Observer characterViewEventBox(CharacterViewModel _characterViewModel) {
  return Observer(
    builder: (_) {
      return _characterViewModel.characterEventsItems!.isEmpty
          ? const CircularProgressIndicator(
              color: Colors.red,
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _characterViewModel.characterEventsItems?.length ?? 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.lowWidthPadding,
                      vertical: context.lowHeightPadding2),
                  child: GestureDetector(
                    onTap: () {
                      /* Navigator.pushNamed(
                                                      context,
                                                      '/characterView',
                                                      arguments: {
                                                        'characterId':
                                                            _characterViewModel
                                                                .characterItems?[
                                                                    index]
                                                                .id,
                                                      }); */
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black26,
                            width: 2,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          ),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 9,
                            child: Container(
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
                                      '${_characterViewModel.characterEventsItems?[index].thumbnail!.path}.${_characterViewModel.characterEventsItems?[index].thumbnail!.extension}',
                                  errorWidget: (context, url, error) =>
                                      const CircularProgressIndicator(
                                    color: Colors.white,
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
  );
}
