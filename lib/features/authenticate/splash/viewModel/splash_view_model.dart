import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../home/home/viewModel/home_view_model.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/base/model/base_view_model.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  late final HomeViewModel _homeViewModel;

  @override
  void setContext(BuildContext context) => this.baseViewContext = context;

  @override
  void init({int? id}) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      militaryGateControl();
    });
  }

  @observable
  bool isFirstInit = true;

  @action
  void _changeFirstInit() {
    isFirstInit = !isFirstInit;
  }

  @action
  void militaryGateControl() {
    Future.delayed(Duration(seconds: 3), () {
      navigation.navigateToPage(path: NavigationConstants.HOME_VIEW);
    });
    /* if (_homeViewModel.characterItems != []) {
      if (_homeViewModel.comicItems != []) {
        if (_homeViewModel.seriesItems != []) {
          Map<String, dynamic> deneme = {
            'character': _homeViewModel.characterItems,
            'comic': _homeViewModel.comicItems,
            'series': _homeViewModel.seriesItems,
          };
          
        }
      }
    } */
  }
}
