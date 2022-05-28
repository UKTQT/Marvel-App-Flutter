import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extensions/padding_extension/padding_extension.dart';
import '../../../../core/extensions/color_extension/color_extension.dart';
import '../viewModel/character_view_model.dart';
import 'character_view_description_box/character_view_description_box.dart';
import 'character_view_image_box/character_view_image_box.dart';

class CharacterView extends StatelessWidget {
  const CharacterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return BaseView<CharacterViewModel>(
        viewModel: CharacterViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init(id: args['characterId']);
        },
        onPageBuilder:
            (BuildContext context, CharacterViewModel _characterViewModel) {
          return Scaffold(
              body: SafeArea(
                  child: Column(children: [
            Expanded(flex: 6, child: characterViewImageBox(args, context)),
            Expanded(
                flex: 8,
                child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: context.themeMainColor1,
                        boxShadow: [
                          BoxShadow(
                              color: context.themeMainColor1,
                              spreadRadius: 40,
                              blurRadius: 20)
                        ]),
                    child: Padding(
                        padding:
                            EdgeInsets.only(top: context.mediumHeightPadding2),
                        child: character_view_description_box(
                            context, args, _characterViewModel))))
          ])));
        });
  }
}
