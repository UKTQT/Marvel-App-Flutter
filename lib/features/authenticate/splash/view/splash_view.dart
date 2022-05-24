import 'package:flutter/material.dart';
import 'package:marvel/features/authenticate/splash/viewModel/splash_view_model.dart';

import '../../../../core/base/view/base_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel) {
        return splashScaffold();
      },
    );
  }

  Scaffold splashScaffold() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: Center(child: Text('Marvel'))),
    );
  }
}
