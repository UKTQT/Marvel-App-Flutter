import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../home/home/viewModel/home_view_model.dart';
import '../../../../core/base/model/base_view_model.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  late final HomeViewModel _homeViewModel;

  @override
  void init() {
    _homeViewModel = HomeViewModel();
  }

  @override
  void setContext(BuildContext context) {
    this.baseViewContext = context;
  }

  void militaryControl() {
    if (_homeViewModel.characterItems != []) {
      if (_homeViewModel.comicItems != []) {
        if (_homeViewModel.seriesItems != []) {
          Navigator.pushNamed(context, '/homeView');
        }
      }
    }
  }
}
