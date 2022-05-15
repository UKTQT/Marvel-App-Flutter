import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../view_model/character_view_model.dart';
import '../extension/padding_extension.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({Key? key}) : super(key: key);

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final characterAllItems = CharacterViewModel.characterItems
        ?.firstWhere((element) => element.id == args['characterId']);

    var characterDate = DateTime.parse('${characterAllItems!.modified}')
        .toString()
        .substring(0, 10);

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
                      child: CachedNetworkImage(
                          placeholder: (context, index) {
                            return const CircularProgressIndicator();
                          },
                          imageUrl:
                              '${characterAllItems.thumbnail!.path}.${characterAllItems.thumbnail!.extension}',
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.add)),
                    ),
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
                                  '${characterAllItems.name}',
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
                                '${characterDate.substring(0, 4)}',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        // Description --------------------------------------------
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
                                        characterAllItems
                                                .description!.isNotEmpty
                                            ? '${characterAllItems.description}'
                                            : 'Description not available',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            ?.copyWith(color: Colors.white),
                                      )),
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
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: CharacterViewModel
                                        .characterItems?.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: context.lowWidthPadding,
                                            vertical:
                                                context.lowHeightPadding2),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/characterView',
                                                arguments: {
                                                  'characterId':
                                                      CharacterViewModel
                                                          .characterItems
                                                          ?.elementAt(index)
                                                          .id,
                                                });
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black26,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(15.0),
                                                  bottomRight:
                                                      Radius.circular(15.0),
                                                ),
                                                color: Colors.white),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 9,
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.35,
                                                    child: FittedBox(
                                                      fit: BoxFit.fill,
                                                      child: Hero(
                                                        tag: 'character_image',
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
                                                                    '${CharacterViewModel.characterItems?.elementAt(index).thumbnail!.path}.${CharacterViewModel.characterItems?.elementAt(index).thumbnail!.extension}',
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    const CircularProgressIndicator(
                                                                      color: Colors
                                                                          .white,
                                                                    )),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: context
                                                            .lowWidthPadding2),
                                                    child: Container(
                                                      width: double.maxFinite,
                                                      child: Center(
                                                        child: Text(
                                                          CharacterViewModel
                                                                  .characterItems
                                                                  ?.elementAt(
                                                                      index)
                                                                  .name ??
                                                              '',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1,
                                                          softWrap: false,
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
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: CharacterViewModel
                                        .characterItems?.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: context.lowWidthPadding,
                                            vertical:
                                                context.lowHeightPadding2),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/characterView',
                                                arguments: {
                                                  'characterId':
                                                      CharacterViewModel
                                                          .characterItems
                                                          ?.elementAt(index)
                                                          .id,
                                                });
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black26,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(15.0),
                                                  bottomRight:
                                                      Radius.circular(15.0),
                                                ),
                                                color: Colors.white),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 9,
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.35,
                                                    child: FittedBox(
                                                      fit: BoxFit.fill,
                                                      child: Hero(
                                                        tag: 'character_image',
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
                                                              '${CharacterViewModel.characterItems?.elementAt(index).thumbnail!.path}.${CharacterViewModel.characterItems?.elementAt(index).thumbnail!.extension}',
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              const CircularProgressIndicator(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: context
                                                            .lowWidthPadding2),
                                                    child: Container(
                                                      width: double.maxFinite,
                                                      child: Center(
                                                        child: Text(
                                                          CharacterViewModel
                                                                  .characterItems
                                                                  ?.elementAt(
                                                                      index)
                                                                  .name ??
                                                              '',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1,
                                                          softWrap: false,
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
                                        'Stories',
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
                                      MediaQuery.of(context).size.height * 0.15,
                                  width: double.maxFinite,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          child: ListTile(
                                            title: const Text('ewq'),
                                            leading: Container(
                                                child: const Text('ewq')),
                                          ),
                                        ),
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
                                      MediaQuery.of(context).size.height * 0.15,
                                  width: double.maxFinite,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          child: ListTile(
                                            title: const Text('ewq'),
                                            leading: Container(
                                                child: const Text('ewq')),
                                          ),
                                        ),
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
}
