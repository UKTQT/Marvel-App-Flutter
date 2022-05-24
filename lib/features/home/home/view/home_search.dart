import 'package:flutter/material.dart';

import '../../../../core/constants/app/app_constants.dart';
import '../../../../../core/extensions/color_extension/color_extension.dart';

import '../viewModel/home_view_model.dart';

Padding homeSearch(
    {required BuildContext context, required HomeViewModel homeViewModel}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: TextFormField(
      onChanged: (String searchValue) {
        Future.delayed(const Duration(milliseconds: 500), () {
          homeViewModel.searchItems = searchValue;
        });
      },
      decoration: InputDecoration(
        labelText: AppConstant.instance!.HOME_VIEW_SEARCH_INPUT_TEXT,
        labelStyle: TextStyle(color: context.homePageSearchInputTextColor),
        prefixIcon: const Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.whiteColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.whiteColor, width: 2),
        ),
      ),
    ),
  );
}
