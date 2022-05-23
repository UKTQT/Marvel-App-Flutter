import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel/core/constants/app/app_constant.dart';

import '../../../character/viewModel/character_view_model.dart';
import 'character_box_card.dart';
import 'character_box_title.dart';

Column homeCharacter(
    {required BuildContext context,
    required CharacterViewModel characterViewModel}) {
  return Column(
    children: [
      characterBoxTitle(context),
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
                    itemCount:
                        characterViewModel.characterItems!.isNotEmpty ? 20 : 0,
                    itemBuilder: (context, index) {
                      return characterCard(context, characterViewModel, index);
                    },
                  );
          },
        ),
      ),
    ],
  );
}
