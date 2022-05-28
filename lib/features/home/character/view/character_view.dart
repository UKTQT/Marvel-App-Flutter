import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extensions/padding_extension/padding_extension.dart';
import '../viewModel/character_view_model.dart';

class CharacterView extends StatelessWidget {
  const CharacterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    /* _characterViewModel.fetchCharacterComicsItems(
        characterId: args['characterId']);
    _characterViewModel.fetchCharacterSeriesItems(
        characterId: args['characterId']);
    _characterViewModel.fetchCharacterEventsItems(
        characterId: args['characterId']); */

    return BaseView<CharacterViewModel>(
      viewModel: CharacterViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init(id: args['characterId']);
      },
      onPageBuilder:
          (BuildContext context, CharacterViewModel _characterViewModel) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: FittedBox(
                            fit: BoxFit.cover,
                            child: Hero(
                              tag: args['characterId'],
                              child: CachedNetworkImage(
                                imageUrl: args['characterPath'] +
                                    '.' +
                                    args['characterExt'],
                                placeholder: (context, index) {
                                  return const CircularProgressIndicator();
                                },
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.add),
                              ),
                            )),
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: context.mediumWidthPadding2,
                                vertical: context.lowHeightPadding2,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 25,
                                  color: Colors.black,
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      color: Color(0xff121212),
                      /*  border: Border.all(
                      color: Colors.black,
                      width: 2,
                      style: BorderStyle.solid,
                    ), */
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff121212),
                          spreadRadius: 40,
                          blurRadius: 20,
                        )
                      ],
                      /*  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ), */
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: context.mediumHeightPadding2),
                      child: Column(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Text(
                                      args['characterName'],
                                      overflow: TextOverflow.clip,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          ?.copyWith(
                                              fontFamily: 'RaleWay',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    DateTime.parse(
                                            '${args['characterModified']}')
                                        .toString()
                                        .substring(0, 4),
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
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
                                      child: Row(
                                        children: [
                                          Text(
                                            'Description',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xffED1D24),
                                                ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: context.highWidthPadding,
                                        right: context.highWidthPadding,
                                        top: context.lowHeightPadding2,
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              args['characterDescription'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  ?.copyWith(
                                                      color: Colors.white),
                                            ),
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
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xffED1D24),
                                                ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: context.lowHeightPadding),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.28,
                                      width: double.maxFinite,
                                      child: Observer(
                                        builder: (_) {
                                          return _characterViewModel
                                                  .characterComicsItems!.isEmpty
                                              ? const CircularProgressIndicator(
                                                  color: Colors.red,
                                                )
                                              : ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: _characterViewModel
                                                          .characterComicsItems
                                                          ?.length ??
                                                      1,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10.0,
                                                          vertical: 10.0),
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.35,
                                                          child: FittedBox(
                                                            fit: BoxFit.fill,
                                                            child:
                                                                CachedNetworkImage(
                                                              placeholder:
                                                                  (context,
                                                                      index) {
                                                                return const CircularProgressIndicator(
                                                                  color: Colors
                                                                      .white,
                                                                );
                                                              },
                                                              imageUrl:
                                                                  '${_characterViewModel.characterComicsItems?[index].thumbnail?.path}.${_characterViewModel.characterComicsItems?[index].thumbnail?.extension}',
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  const CircularProgressIndicator(
                                                                color: Colors
                                                                    .white,
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
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xffd32f2f),
                                                ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.30,
                                      width: double.maxFinite,
                                      child: Observer(
                                        builder: (_) {
                                          return _characterViewModel
                                                  .characterSeriesItems!.isEmpty
                                              ? const CircularProgressIndicator(
                                                  color: Colors.red,
                                                )
                                              : ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: _characterViewModel
                                                          .characterSeriesItems
                                                          ?.length ??
                                                      1,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: context
                                                              .lowWidthPadding,
                                                          vertical: context
                                                              .lowHeightPadding2),
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
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.35,
                                                          decoration:
                                                              BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .black26,
                                                                    width: 2,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            15.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            15.0),
                                                                  ),
                                                                  color: Colors
                                                                      .white),
                                                          child: Column(
                                                            children: [
                                                              Expanded(
                                                                flex: 9,
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.35,
                                                                  child:
                                                                      FittedBox(
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      placeholder:
                                                                          (context,
                                                                              index) {
                                                                        return const CircularProgressIndicator(
                                                                          color:
                                                                              Colors.white,
                                                                        );
                                                                      },
                                                                      imageUrl:
                                                                          '${_characterViewModel.characterSeriesItems?[index].thumbnail!.path}.${_characterViewModel.characterSeriesItems?[index].thumbnail!.extension}',
                                                                      errorWidget: (context,
                                                                              url,
                                                                              error) =>
                                                                          const CircularProgressIndicator(
                                                                        color: Colors
                                                                            .white,
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
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xffd32f2f),
                                                ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.30,
                                      width: double.maxFinite,
                                      child: Observer(
                                        builder: (_) {
                                          return _characterViewModel
                                                  .characterEventsItems!.isEmpty
                                              ? const CircularProgressIndicator(
                                                  color: Colors.red,
                                                )
                                              : ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: _characterViewModel
                                                          .characterEventsItems
                                                          ?.length ??
                                                      1,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: context
                                                              .lowWidthPadding,
                                                          vertical: context
                                                              .lowHeightPadding2),
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
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.35,
                                                          decoration:
                                                              BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .black26,
                                                                    width: 2,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            15.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            15.0),
                                                                  ),
                                                                  color: Colors
                                                                      .white),
                                                          child: Column(
                                                            children: [
                                                              Expanded(
                                                                flex: 9,
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.35,
                                                                  child:
                                                                      FittedBox(
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      placeholder:
                                                                          (context,
                                                                              index) {
                                                                        return const CircularProgressIndicator(
                                                                          color:
                                                                              Colors.white,
                                                                        );
                                                                      },
                                                                      imageUrl:
                                                                          '${_characterViewModel.characterEventsItems?[index].thumbnail!.path}.${_characterViewModel.characterEventsItems?[index].thumbnail!.extension}',
                                                                      errorWidget: (context,
                                                                              url,
                                                                              error) =>
                                                                          const CircularProgressIndicator(
                                                                        color: Colors
                                                                            .white,
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
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
/* class CharacterView extends StatefulWidget {
  const CharacterView({Key? key}) : super(key: key);

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  late CharacterViewModel _characterViewModel;

  @override
  void initState() {
    _characterViewModel = CharacterViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    _characterViewModel.fetchCharacterComicsItems(
        characterId: args['characterId']);
    _characterViewModel.fetchCharacterSeriesItems(
        characterId: args['characterId']);
    _characterViewModel.fetchCharacterEventsItems(
        characterId: args['characterId']);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: FittedBox(
                        fit: BoxFit.cover,
                        child: Hero(
                          tag: args['characterId'],
                          child: CachedNetworkImage(
                            imageUrl: args['characterPath'] +
                                '.' +
                                args['characterExt'],
                            placeholder: (context, index) {
                              return const CircularProgressIndicator();
                            },
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.add),
                          ),
                        )),
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.mediumWidthPadding2,
                            vertical: context.lowHeightPadding2,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 25,
                              color: Colors.black,
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Color(0xff121212),
                  /*  border: Border.all(
                      color: Colors.black,
                      width: 2,
                      style: BorderStyle.solid,
                    ), */
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff121212),
                      spreadRadius: 40,
                      blurRadius: 20,
                    )
                  ],
                  /*  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ), */
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: context.mediumHeightPadding2),
                  child: Column(
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      ?.copyWith(
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
                                  child: Row(
                                    children: [
                                      Text(
                                        'Description',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xffED1D24),
                                            ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: context.highWidthPadding,
                                    right: context.highWidthPadding,
                                    top: context.lowHeightPadding2,
                                  ),
                                  child: Row(
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xffED1D24),
                                            ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: context.lowHeightPadding),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.28,
                                  width: double.maxFinite,
                                  child: Observer(
                                    builder: (_) {
                                      return _characterViewModel
                                              .characterComicsItems!.isEmpty
                                          ? const CircularProgressIndicator(
                                              color: Colors.red,
                                            )
                                          : ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: _characterViewModel
                                                      .characterComicsItems
                                                      ?.length ??
                                                  1,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 10.0),
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
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.35,
                                                      child: FittedBox(
                                                        fit: BoxFit.fill,
                                                        child:
                                                            CachedNetworkImage(
                                                          placeholder:
                                                              (context, index) {
                                                            return const CircularProgressIndicator(
                                                              color:
                                                                  Colors.white,
                                                            );
                                                          },
                                                          imageUrl:
                                                              '${_characterViewModel.characterComicsItems?[index].thumbnail?.path}.${_characterViewModel.characterComicsItems?[index].thumbnail?.extension}',
                                                          errorWidget: (context,
                                                                  url, error) =>
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xffd32f2f),
                                            ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.30,
                                  width: double.maxFinite,
                                  child: Observer(
                                    builder: (_) {
                                      return _characterViewModel
                                              .characterSeriesItems!.isEmpty
                                          ? const CircularProgressIndicator(
                                              color: Colors.red,
                                            )
                                          : ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: _characterViewModel
                                                      .characterSeriesItems
                                                      ?.length ??
                                                  1,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: context
                                                          .lowWidthPadding,
                                                      vertical: context
                                                          .lowHeightPadding2),
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
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.35,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color:
                                                                Colors.black26,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    15.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    15.0),
                                                          ),
                                                          color: Colors.white),
                                                      child: Column(
                                                        children: [
                                                          Expanded(
                                                            flex: 9,
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.35,
                                                              child: FittedBox(
                                                                fit:
                                                                    BoxFit.fill,
                                                                child:
                                                                    CachedNetworkImage(
                                                                  placeholder:
                                                                      (context,
                                                                          index) {
                                                                    return const CircularProgressIndicator(
                                                                      color: Colors
                                                                          .white,
                                                                    );
                                                                  },
                                                                  imageUrl:
                                                                      '${_characterViewModel.characterSeriesItems?[index].thumbnail!.path}.${_characterViewModel.characterSeriesItems?[index].thumbnail!.extension}',
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      const CircularProgressIndicator(
                                                                    color: Colors
                                                                        .white,
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xffd32f2f),
                                            ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.30,
                                  width: double.maxFinite,
                                  child: Observer(
                                    builder: (_) {
                                      return _characterViewModel
                                              .characterEventsItems!.isEmpty
                                          ? const CircularProgressIndicator(
                                              color: Colors.red,
                                            )
                                          : ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: _characterViewModel
                                                      .characterEventsItems
                                                      ?.length ??
                                                  1,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: context
                                                          .lowWidthPadding,
                                                      vertical: context
                                                          .lowHeightPadding2),
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
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.35,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color:
                                                                Colors.black26,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    15.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    15.0),
                                                          ),
                                                          color: Colors.white),
                                                      child: Column(
                                                        children: [
                                                          Expanded(
                                                            flex: 9,
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.35,
                                                              child: FittedBox(
                                                                fit:
                                                                    BoxFit.fill,
                                                                child:
                                                                    CachedNetworkImage(
                                                                  placeholder:
                                                                      (context,
                                                                          index) {
                                                                    return const CircularProgressIndicator(
                                                                      color: Colors
                                                                          .white,
                                                                    );
                                                                  },
                                                                  imageUrl:
                                                                      '${_characterViewModel.characterEventsItems?[index].thumbnail!.path}.${_characterViewModel.characterEventsItems?[index].thumbnail!.extension}',
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      const CircularProgressIndicator(
                                                                    color: Colors
                                                                        .white,
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
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} */
