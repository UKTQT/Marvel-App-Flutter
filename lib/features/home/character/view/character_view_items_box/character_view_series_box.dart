import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/extensions/padding_extension/padding_extension.dart';
import '../../../../../core/extensions/color_extension/color_extension.dart';
import '../../viewModel/character_view_model.dart';

Observer characterViewSeriesBox(
    BuildContext context, CharacterViewModel _characterViewModel) {
  return Observer(builder: (_) {
    return _characterViewModel.characterSeriesItems!.isEmpty
        ? CircularProgressIndicator(color: context.marvelRed)
        : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _characterViewModel.characterSeriesItems?.length ?? 1,
            itemBuilder: (context, index) {
              return seriesItem(context, _characterViewModel, index);
            });
  });
}

Padding seriesItem(
    BuildContext context, CharacterViewModel _characterViewModel, int index) {
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
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0)),
                  color: context.whiteColor),
              child: Column(children: [
                Expanded(
                    flex: 9,
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: FittedBox(
                            fit: BoxFit.fill,
                            child: CachedNetworkImage(
                                placeholder: (context, index) {
                                  return CircularProgressIndicator(
                                      color: context.whiteColor);
                                },
                                imageUrl:
                                    '${_characterViewModel.characterSeriesItems?[index].thumbnail!.path}.${_characterViewModel.characterSeriesItems?[index].thumbnail!.extension}',
                                errorWidget: (context, url, error) =>
                                    CircularProgressIndicator(
                                        color: context.whiteColor)))))
              ]))));
}
