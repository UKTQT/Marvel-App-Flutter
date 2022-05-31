import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel/core/extensions/color_extension/color_extension.dart';
import 'package:marvel/core/extensions/padding_extension/padding_extension.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../viewModel/comic_view_model.dart';

class ComicView extends StatelessWidget {
  const ComicView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return BaseView<ComicViewModel>(
      viewModel: ComicViewModel(),
      onModelReady: (model) {
        model.init();
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, ComicViewModel _comicViewModel) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              height: double.maxFinite,
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Hero(
                            tag: args['comicId'],
                            child: CachedNetworkImage(
                                imageUrl:
                                    args['comicPath'] + '.' + args['comicExt'],
                                placeholder: (context, index) {
                                  return Placeholder();
                                },
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.add)),
                          ),
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
                              splashColor: Colors.white,
                              highlightColor: Colors.white,
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 25,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  DraggableScrollableSheet(
                    initialChildSize: 0.1,
                    minChildSize: 0.1,
                    maxChildSize: 0.7,
                    snap: true,
                    snapSizes: [.7],
                    builder: (context, scrollController) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: context.lowHeightPadding2),
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.highWidthPadding),
                              child: Column(
                                children: [
                                  //SizedBox(height: context.lowHeightPadding),
                                  Center(
                                    child: Icon(
                                      Icons.bakery_dining,
                                      size: 40.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                      height: context.mediumHeightPadding2),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 9,
                                        child: Text(args['comicTitle'],
                                            overflow: TextOverflow.clip,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5
                                                ?.copyWith(
                                                    fontFamily: 'RaleWay',
                                                    color: context.whiteColor,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                      ),
                                      Expanded(
                                          flex: 1, child: SizedBox.shrink()),
                                      Expanded(
                                        flex: 0,
                                        child: Text(
                                            args['comicPrice'].toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: context.highHeightPadding),
                                  Row(children: [
                                    Expanded(
                                        child: Text(args['comicModified'],
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                ?.copyWith(
                                                    color: context.whiteColor)))
                                  ]),
                                  SizedBox(height: context.mediumHeightPadding),
                                  Row(children: [
                                    Text(
                                        AppConstant.instance!
                                            .CHARACTER_VIEW_DESCRIPTION_TEXT,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: context.marvelRed))
                                  ]),
                                  SizedBox(height: context.lowHeightPadding2),
                                  Row(children: [
                                    Expanded(
                                        child: Text(args['comicDescription'],
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                ?.copyWith(
                                                    color: context.whiteColor)))
                                  ]),
                                  SizedBox(height: context.highHeightPadding),
                                  Observer(
                                    builder: (_) {
                                      return _comicViewModel
                                              .comicCharacterItems!.isEmpty
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                  CircularProgressIndicator(
                                                      color: context.marvelRed)
                                                ])
                                          : ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: _comicViewModel
                                                      .comicCharacterItems
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
                                                          color: context
                                                              .whiteColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0)),
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
                                                            return const Placeholder();
                                                          },
                                                          imageUrl:
                                                              '${_comicViewModel.comicCharacterItems?[index].thumbnail?.path}.${_comicViewModel.comicCharacterItems?[index].thumbnail?.extension}',
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              CircularProgressIndicator(
                                                                  color: context
                                                                      .whiteColor),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
