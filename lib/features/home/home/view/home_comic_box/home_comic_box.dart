import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/extensions/color_extension/color_extension.dart';
import '../../viewModel/home_view_model.dart';
import 'home_comic_box_card.dart';
import 'home_comic_box_title.dart';

Column homeComic(
    {required BuildContext context, required HomeViewModel homeViewModel}) {
  return Column(
    children: [
      comicBoxTitle(context),
      Expanded(
        child: Observer(
          builder: (_) {
            return homeViewModel.comicItemsIsLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: context.marvelRed,
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeViewModel.comicItems!.isNotEmpty ? 20 : 0,
                    itemBuilder: (context, index) {
                      return comicCard(
                          context: context,
                          homeViewModel: homeViewModel,
                          index: index);
                    },
                  );
          },
        ),
      ),
    ],
  );
}
