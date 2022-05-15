import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../view_model/comic_view_model.dart';
import '../extension/padding_extension.dart';

class ComicView extends StatefulWidget {
  const ComicView({Key? key}) : super(key: key);

  @override
  State<ComicView> createState() => _ComicViewState();
}

class _ComicViewState extends State<ComicView> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final comicAllItems = ComicViewModel.comicItems
        ?.firstWhere((element) => element.id == args['comicId']);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: FittedBox(
                fit: BoxFit.fill,
                child: CachedNetworkImage(
                    placeholder: (context, index) {
                      return const CircularProgressIndicator();
                    },
                    imageUrl:
                        '${comicAllItems!.thumbnail!.path}.${comicAllItems.thumbnail!.extension}',
                    errorWidget: (context, url, error) =>
                        const CircularProgressIndicator()),
              ),
            ),
            Container(
              color: Colors.white24,
              child: Row(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
