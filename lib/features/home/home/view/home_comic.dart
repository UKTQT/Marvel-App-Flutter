import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/extensions/padding_extension/padding_extension.dart';
import '../../comic/viewModel/comic_view_model.dart';

Column homeComic(
    {required BuildContext context, required ComicViewModel comicViewModel}) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: context.mediumWidthPadding2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Comics',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'All Comics >>',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: Observer(
          builder: (_) {
            return !comicViewModel.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: comicViewModel.comicItems!.isNotEmpty ? 20 : 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/comicView',
                                arguments: {
                                  'comicId':
                                      comicViewModel.comicItems![index].id,
                                });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Hero(
                                tag: '${comicViewModel.comicItems![index].id}',
                                child: CachedNetworkImage(
                                  placeholder: (context, index) {
                                    return const CircularProgressIndicator(
                                      color: Colors.white,
                                    );
                                  },
                                  imageUrl:
                                      '${comicViewModel.comicItems![index].thumbnail!.path}.${comicViewModel.comicItems![index].thumbnail!.extension}',
                                  errorWidget: (context, url, error) =>
                                      const CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
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
    ],
  );
}
