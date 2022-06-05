import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/extensions/padding_extension/padding_extension.dart';
import '../../../../../core/extensions/color_extension/color_extension.dart';
import '../../viewModel/character_view_model.dart';

Observer characterViewEventBox(
    BuildContext context, CharacterViewModel _characterViewModel) {
  return Observer(builder: (_) {
    return _characterViewModel.comicsItemsIsLoading
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator(color: context.marvelRed)])
        : _characterViewModel.characterEventsItems!.isEmpty
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Events are not available')],
              )
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    _characterViewModel.characterEventsItems?.length ?? 1,
                itemBuilder: (context, index) {
                  return eventItem(context, _characterViewModel, index);
                });
  });
}

Padding eventItem(
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
                                return const Placeholder();
                              },
                              imageUrl:
                                  '${_characterViewModel.characterEventsItems?[index].thumbnail!.path}.${_characterViewModel.characterEventsItems?[index].thumbnail!.extension}',
                              errorWidget: (context, url, error) =>
                                  CircularProgressIndicator(
                                      color: context.whiteColor),
                            ))))
              ]))));
}
