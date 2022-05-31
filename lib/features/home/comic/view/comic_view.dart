import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:marvel/core/extensions/padding_extension/padding_extension.dart';

import '../../../../core/base/view/base_view.dart';
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
          body: Container(
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
                  maxChildSize: 0.5,
                  builder: (context, scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Detay',
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
