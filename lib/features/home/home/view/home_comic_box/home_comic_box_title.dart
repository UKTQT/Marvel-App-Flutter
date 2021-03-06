import 'package:flutter/material.dart';

import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/extensions/padding_extension/padding_extension.dart';

Padding comicBoxTitle(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: context.mediumWidthPadding2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppConstant.instance!.HOME_VIEW_COMIC_BOX_TITLE,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            AppConstant.instance!.HOME_VIEW_COMIC_BOX_TITLE2,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    ),
  );
}
