import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/extensions/padding_extension/padding_extension.dart';
import '../../../../../core/extensions/color_extension/color_extension.dart';
import '../../viewModel/character_view_model.dart';

Column characterViewDescriptionBox(BuildContext context,
    Map<dynamic, dynamic> args, CharacterViewModel _characterViewModel) {
  return Column(
    children: [
      Expanded(
        flex: 0,
        child: Padding(
          padding: EdgeInsets.only(
            left: context.highWidthPadding,
            right: context.highWidthPadding,
            bottom: context.mediumHeightPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Text(
                  args['characterName'],
                  overflow: TextOverflow.clip,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontFamily: 'RaleWay',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                DateTime.parse('${args['characterModified']}')
                    .toString()
                    .substring(0, 4),
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        ),
      ),
      Expanded(
        flex: 5,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: context.mediumHeightPadding,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: context.highWidthPadding,
                    right: context.highWidthPadding,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Description',
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xffED1D24),
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(height: context.lowHeightPadding2),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              args['characterDescription'],
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: context.highWidthPadding,
                      right: context.highWidthPadding,
                      top: context.highHeightPadding2),
                  child: Row(
                    children: [
                      Text(
                        'Comics',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffED1D24),
                            ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: context.lowHeightPadding2),
                Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  width: double.maxFinite,
                  child: Observer(
                    builder: (_) {
                      return _characterViewModel.characterComicsItems!.isEmpty
                          ? const CircularProgressIndicator(
                              color: Colors.red,
                            )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _characterViewModel
                                      .characterComicsItems?.length ??
                                  1,
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
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
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
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: context.lowHeightPadding2,
                    left: context.highWidthPadding,
                    right: context.highWidthPadding,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Series',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffd32f2f),
                            ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: double.maxFinite,
                  child: Observer(
                    builder: (_) {
                      return _characterViewModel.characterSeriesItems!.isEmpty
                          ? const CircularProgressIndicator(
                              color: Colors.red,
                            )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _characterViewModel
                                      .characterSeriesItems?.length ??
                                  1,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.35,
                                              child: FittedBox(
                                                fit: BoxFit.fill,
                                                child: CachedNetworkImage(
                                                  placeholder:
                                                      (context, index) {
                                                    return const CircularProgressIndicator(
                                                      color: Colors.white,
                                                    );
                                                  },
                                                  imageUrl:
                                                      '${_characterViewModel.characterSeriesItems?[index].thumbnail!.path}.${_characterViewModel.characterSeriesItems?[index].thumbnail!.extension}',
                                                  errorWidget: (context, url,
                                                          error) =>
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
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: context.lowHeightPadding2,
                    left: context.highWidthPadding,
                    right: context.highWidthPadding,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Events',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffd32f2f),
                            ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: double.maxFinite,
                  child: Observer(
                    builder: (_) {
                      return _characterViewModel.characterEventsItems!.isEmpty
                          ? const CircularProgressIndicator(
                              color: Colors.red,
                            )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _characterViewModel
                                      .characterEventsItems?.length ??
                                  1,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.35,
                                              child: FittedBox(
                                                fit: BoxFit.fill,
                                                child: CachedNetworkImage(
                                                  placeholder:
                                                      (context, index) {
                                                    return const CircularProgressIndicator(
                                                      color: Colors.white,
                                                    );
                                                  },
                                                  imageUrl:
                                                      '${_characterViewModel.characterEventsItems?[index].thumbnail!.path}.${_characterViewModel.characterEventsItems?[index].thumbnail!.extension}',
                                                  errorWidget: (context, url,
                                                          error) =>
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
