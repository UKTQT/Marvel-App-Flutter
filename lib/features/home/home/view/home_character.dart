import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/extensions/padding_extension/padding_extension.dart';

class HomeCharacter extends StatelessWidget {
  final characterViewModel;

  const HomeCharacter({
    Key? key,
    required this.characterViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: context.mediumWidthPadding2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Characters',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'All Rnd 100 Characters >>',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Observer(
            builder: (_) {
              return !characterViewModel.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: characterViewModel.characterItems!.isNotEmpty
                          ? 20
                          : 0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: context.lowWidthPadding,
                              vertical: context.lowHeightPadding2),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/characterView',
                                arguments: {
                                  'characterId': characterViewModel
                                      .characterItems![index].id,
                                  'characterName': characterViewModel
                                      .characterItems![index].name,
                                  'characterDescription': characterViewModel
                                          .characterItems![index]
                                          .description!
                                          .isEmpty
                                      ? 'Description not available'
                                      : characterViewModel
                                          .characterItems![index].description,
                                  'characterModified': characterViewModel
                                      .characterItems![index].modified,
                                  'characterPath': characterViewModel
                                      .characterItems![index].thumbnail?.path,
                                  'characterExt': characterViewModel
                                      .characterItems![index]
                                      .thumbnail
                                      ?.extension,
                                  'characterComics': characterViewModel
                                      .characterItems![index]
                                      .comics
                                      ?.collectionUri,
                                  'characterSeries': characterViewModel
                                      .characterItems![index]
                                      .series
                                      ?.collectionUri,
                                  'characterStories': characterViewModel
                                      .characterItems![index]
                                      .stories
                                      ?.collectionUri,
                                  'characterEvents': characterViewModel
                                      .characterItems![index]
                                      .events
                                      ?.collectionUri,
                                },
                              );
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
                                  color: Color(0xff202020)),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 9,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Hero(
                                          tag:
                                              '${characterViewModel.characterItems![index].id}',
                                          child: characterViewModel
                                                      .characterItems![index]
                                                      .thumbnail !=
                                                  null
                                              ? CachedNetworkImage(
                                                  imageUrl:
                                                      '${characterViewModel.characterItems![index].thumbnail?.path}.${characterViewModel.characterItems![index].thumbnail?.extension}',
                                                  placeholder: (context, url) =>
                                                      const CircularProgressIndicator(
                                                    color: Colors.red,
                                                  ),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                )
                                              : const CircularProgressIndicator(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: context.lowWidthPadding2),
                                      child: Container(
                                        width: double.maxFinite,
                                        child: Center(
                                          child: Text(
                                            characterViewModel
                                                    .characterItems![index]
                                                    .name ??
                                                '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(color: Colors.white),
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
                    );
            },
          ),
        ),
      ],
    );
  }
}
