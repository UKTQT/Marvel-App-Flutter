import 'package:flutter/material.dart';

import '../viewModel/home_view_model.dart';

Padding homeSearch({required HomeViewModel homeViewModel}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: TextFormField(
      onChanged: (String searchValue) {
        Future.delayed(const Duration(milliseconds: 500), () {
          homeViewModel.searchItems = searchValue;
        });
      },
      decoration: const InputDecoration(
        labelText: 'Characters, Comics, Series....',
        labelStyle: TextStyle(color: Colors.white60),
        prefixIcon: Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
      ),
    ),
  );
}
