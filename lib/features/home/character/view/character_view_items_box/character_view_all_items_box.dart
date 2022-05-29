import 'package:flutter/material.dart';
import 'package:marvel/core/constants/app/app_constants.dart';

import '../../../../../core/extensions/padding_extension/padding_extension.dart';
import '../../../../../core/extensions/color_extension/color_extension.dart';
import '../../viewModel/character_view_model.dart';
import 'character_view_comic_box.dart';
import 'character_view_event_box.dart';
import 'character_view_series_box.dart';

Column characterViewItemsBox(BuildContext context, Map<dynamic, dynamic> args,
    CharacterViewModel _characterViewModel) {
  return Column(children: [
    // --- Character Name
    Expanded(
        flex: 0,
        child: Padding(
            padding: EdgeInsets.only(
                left: context.highWidthPadding,
                right: context.highWidthPadding,
                bottom: context.mediumHeightPadding),
            child: characterViewName(args, context))),
    // --- Character All Items
    Expanded(
        flex: 5,
        child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(top: context.mediumHeightPadding),
                child: characterViewAllElements(
                    context, args, _characterViewModel))))
  ]);
}

Row characterViewName(Map<dynamic, dynamic> args, BuildContext context) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
    Expanded(
        child: Text(args['characterName'],
            overflow: TextOverflow.clip,
            style: Theme.of(context).textTheme.headline4?.copyWith(
                fontFamily: 'RaleWay',
                color: context.whiteColor,
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
    // ----------- Description Title And Contents
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
    // ----------- Comics Title And Contents
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
        child: characterViewComicBox(context, _characterViewModel)),
    // ----------- Series Title And Contents
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
        child: characterViewSeriesBox(context, _characterViewModel)),
    // ----------- Events Title And Contents
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
        child: characterViewEventBox(context, _characterViewModel))
  ]);
}
