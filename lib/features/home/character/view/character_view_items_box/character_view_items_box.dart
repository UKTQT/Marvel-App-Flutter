import 'package:flutter/material.dart';
import 'package:marvel/core/constants/app/app_constants.dart';

import '../../../../../core/extensions/padding_extension/padding_extension.dart';
import '../../../../../core/extensions/color_extension/color_extension.dart';
import '../../viewModel/character_view_model.dart';
import 'character_view_comic_box.dart';
import 'character_view_event_box.dart';
import 'character_view_series_box.dart';

Column characterViewDescriptionBox(BuildContext context,
    Map<dynamic, dynamic> args, CharacterViewModel _characterViewModel) {
  return Column(children: [
    Expanded(
        flex: 0,
        child: Padding(
            padding: EdgeInsets.only(
              left: context.highWidthPadding,
              right: context.highWidthPadding,
              bottom: context.mediumHeightPadding,
            ),
            child: characterViewDescriptions(args, context))),
    Expanded(
        flex: 5,
        child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(
                  top: context.mediumHeightPadding,
                ),
                child: characterViewAllElements(
                    context, args, _characterViewModel))))
  ]);
}

Row characterViewDescriptions(
    Map<dynamic, dynamic> args, BuildContext context) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
    Expanded(
        child: Text(args['characterName'],
            overflow: TextOverflow.clip,
            style: Theme.of(context).textTheme.headline4?.copyWith(
                fontFamily: 'RaleWay',
                color: Colors.white,
                fontWeight: FontWeight.bold))),
    Text(
        DateTime.parse('${args['characterModified']}')
            .toString()
            .substring(0, 4),
        style: Theme.of(context).textTheme.subtitle2)
  ]);
}

Column characterViewAllElements(BuildContext context,
    Map<dynamic, dynamic> args, CharacterViewModel _characterViewModel) {
  return Column(children: [
    Padding(
        padding: EdgeInsets.only(
            left: context.highWidthPadding, right: context.highWidthPadding),
        child: Column(children: [
          Row(children: [
            Text(AppConstant.instance!.CHARACTER_VIEW_DESCRIPTION_TEXT,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.bold, color: context.marvelRed))
          ]),
          SizedBox(height: context.lowHeightPadding2),
          Row(children: [
            Expanded(
                child: Text(args['characterDescription'],
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: context.whiteColor)))
          ])
        ])),
    Padding(
        padding: EdgeInsets.only(
            left: context.highWidthPadding,
            right: context.highWidthPadding,
            top: context.highHeightPadding2),
        child: Row(children: [
          Text(AppConstant.instance!.CHARACTER_VIEW_COMICS_TEXT,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.bold, color: context.marvelRed))
        ])),
    SizedBox(height: context.lowHeightPadding2),
    Container(
        height: MediaQuery.of(context).size.height * 0.28,
        width: double.maxFinite,
        child: characterViewComicBox(_characterViewModel)),
    Padding(
        padding: EdgeInsets.only(
            top: context.lowHeightPadding2,
            left: context.highWidthPadding,
            right: context.highWidthPadding),
        child: Row(children: [
          Text(AppConstant.instance!.CHARACTER_VIEW_SERIES_TEXT,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.bold, color: context.marvelRed))
        ])),
    Container(
        height: MediaQuery.of(context).size.height * 0.30,
        width: double.maxFinite,
        child: characterViewSeriesBox(_characterViewModel)),
    Padding(
        padding: EdgeInsets.only(
            top: context.lowHeightPadding2,
            left: context.highWidthPadding,
            right: context.highWidthPadding),
        child: Row(children: [
          Text(AppConstant.instance!.CHARACTER_VIEW_EVENTS_TEXT,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.bold, color: context.marvelRed))
        ])),
    Container(
        height: MediaQuery.of(context).size.height * 0.30,
        width: double.maxFinite,
        child: characterViewEventBox(_characterViewModel))
  ]);
}
