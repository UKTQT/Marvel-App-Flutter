import 'package:flutter/material.dart';
import 'package:marvel/core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../service/splash_service.dart';
import '../../../home/home/view/home_view.dart';
import 'package:mobx/mobx.dart';

import '../../../home/home/viewModel/home_view_model.dart';
import '../../../../core/base/model/base_view_model.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  late final HomeViewModel _homeViewModel;
  //final NavigationService _navigationService = NavigationService.instance;

  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  void init() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _homeViewModel = HomeViewModel();

      _homeViewModel.init();
      militaryGateControl();
    });
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
          Future.delayed(Duration(seconds: 3), () {
            navigation.navigateToPage(path: NavigationConstants.HOME_VIEW);
          });
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
