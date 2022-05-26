import 'package:flutter/material.dart';
import 'package:marvel/core/init/navigation/navigation_service.dart';
import 'package:marvel/features/home/home/view/home_view.dart';
import 'package:mobx/mobx.dart';

import '../../../home/home/viewModel/home_view_model.dart';
import '../../../../core/base/model/base_view_model.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  late final HomeViewModel _homeViewModel;
  late final NavigationService _navigationService;
  var navkey = NavigationService.instance.navigatorKey;

  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  void init() {
    _homeViewModel = HomeViewModel();
    _navigationService = NavigationService.instance;
    _homeViewModel.init();
    militaryGateControl();
  }

  @override
  void setContext(BuildContext context) {
    this.baseViewContext = context;
  }

  void militaryGateControl() {
    if (_homeViewModel.characterItems != []) {
      if (_homeViewModel.comicItems != []) {
        if (_homeViewModel.seriesItems != []) {
          navkey.currentState
              ?.push(MaterialPageRoute(builder: (context) => HomeView()));
        }
      }
    }
  }

  @override
  Future<void> navigateToPageClear({String? path}) async {
    await navkey.currentState!
        .pushNamedAndRemoveUntil(path!, removeAllOldRoutes);
  }
}
