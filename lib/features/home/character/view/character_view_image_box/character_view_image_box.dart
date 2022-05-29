import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../core/extensions/padding_extension/padding_extension.dart';
import '../../../../../core/extensions/color_extension/color_extension.dart';

Stack characterViewImageBox(Map<dynamic, dynamic> args, BuildContext context) {
  return Stack(children: [
    SizedBox(width: double.maxFinite, child: characterImage(args)),
    Row(children: [backIcon(context)])
  ]);
}

FittedBox characterImage(Map<dynamic, dynamic> args) {
  return FittedBox(
      fit: BoxFit.cover,
      child: Hero(
          tag: args['characterId'],
          child: CachedNetworkImage(
              imageUrl: args['characterPath'] + '.' + args['characterExt'],
              placeholder: (context, index) {
                return Placeholder();
              },
              errorWidget: (context, url, error) => const Icon(Icons.add))));
}

Padding backIcon(BuildContext context) {
  return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.mediumWidthPadding2,
          vertical: context.lowHeightPadding2),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
              size: 25, color: context.themeMainColor1)));
}
