import 'package:flutter/material.dart';

import '../../../../../core/constants/app/app_constant.dart';
import '../../../../../core/extensions/padding_extension/padding_extension.dart';

Padding comicBoxTitle(BuildContext context) {
  return Padding(
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
  );
}
