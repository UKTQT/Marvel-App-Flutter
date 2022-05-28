import 'package:flutter/material.dart';

import '../../../../../core/extensions/padding_extension/padding_extension.dart';
import '../../../../../core/extensions/color_extension/color_extension.dart';
import '../../viewModel/home_view_model.dart';

Padding emptyCharacterCard({
  required BuildContext context,
}) {
  return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.lowWidthPadding,
          vertical: context.lowHeightPadding2),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(
            /* border: Border.all(
            color: Colors.black26,
            width: 2,
          ), */
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0)),
            color: context.characterBoxCardColor),
        child: Image(
          image: AssetImage('assets/images/loading_trend.gif'),
        ),
      ));
}

SizedBox characterImage(
    {required BuildContext context,
    required HomeViewModel homeViewModel,
    required int index}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.35,
    child: FittedBox(fit: BoxFit.fill, child: Placeholder()),
  );
}

Padding characterTitle(
    {required BuildContext context,
    required HomeViewModel homeViewModel,
    required int index}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: context.lowWidthPadding2),
    child: SizedBox(
      width: double.maxFinite,
      child: Center(
        child: Text(
          'Loading',
          style: Theme.of(context).textTheme.bodyText1,
          softWrap: false,
        ),
      ),
    ),
  );
}
