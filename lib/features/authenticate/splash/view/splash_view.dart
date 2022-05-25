import 'package:flutter/material.dart';

import '../viewModel/splash_view_model.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/extensions/color_extension/color_extension.dart';

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
        return splashScaffold(context: context);
      },
    );
  }

  Scaffold splashScaffold({required BuildContext context}) {
    return Scaffold(
      backgroundColor: context.themeMainColor1,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                AppConstant.instance!.SPLASH_VIEW_GIF_PATH,
              ),
            ),
            CircularProgressIndicator(color: context.marvelRed)
          ],
        ),
      ),
    );
  }
}
