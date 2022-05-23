import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/extensions/padding_extension/padding_extension.dart';

import '../../../comic/viewModel/comic_view_model.dart';

import 'comic_box_card.dart';
import 'comic_box_title.dart';

Column homeComic(
    {required BuildContext context, required ComicViewModel comicViewModel}) {
  return Column(
    children: [
      comicBoxTitle(context),
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
                      return comicCard(context, comicViewModel, index);
                    },
                  );
          },
        ),
      ),
    ],
  );
}
