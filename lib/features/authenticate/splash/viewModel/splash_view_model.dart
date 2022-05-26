import 'package:flutter/material.dart';
import 'package:marvel/core/init/navigation/navigation_service.dart';
import 'package:marvel/features/authenticate/splash/service/splash_service.dart';
import 'package:marvel/features/home/home/view/home_view.dart';
import 'package:mobx/mobx.dart';

import '../../../home/home/viewModel/home_view_model.dart';
import '../../../../core/base/model/base_view_model.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  late final HomeViewModel _homeViewModel;
  final NavigationService _navigationService = NavigationService.instance;

  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  void init() {
    _homeViewModel = HomeViewModel();

    _homeViewModel.init();
    militaryGateControl();
  }

  @override
  void setContext(BuildContext context) {
    this.baseViewContext = context;
  }

  @action
  void militaryGateControl() {
    if (_homeViewModel.characterItems != []) {
      if (_homeViewModel.comicItems != []) {
        if (_homeViewModel.seriesItems != []) {
          _navigationService.navigateToPage(path: '/homeView');
        }
      }
    }
  }

/*   @override
  Future<void> navigateToPageClear({String? path}) async {
    await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path!, removeAllOldRoutes);
  } */
}
