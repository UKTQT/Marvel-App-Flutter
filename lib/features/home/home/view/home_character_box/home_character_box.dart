import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/extensions/color_extension/color_extension.dart';
import '../../viewModel/home_view_model.dart';
import 'character_box_card.dart';
import 'character_box_title.dart';
import 'empty_character_card.dart';

Column homeCharacter({
  required BuildContext context,
  required HomeViewModel homeViewModel,
}) {
  return Column(
    children: [
      characterBoxTitle(context),
      Expanded(
        child: Observer(
          builder: (_) {
            return homeViewModel.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: context.marvelRed,
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        homeViewModel.characterItems!.isNotEmpty ? 20 : 0,
                    itemBuilder: (context, index) {
                      return characterCard(
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
