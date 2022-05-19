import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel/vb/base/base_state.dart';
import 'package:marvel/vb/base/base_view.dart';
import 'package:marvel/vb/page/viewmodel/page_view_model.dart';

class PageView extends StatefulWidget {
  const PageView({Key? key}) : super(key: key);

  @override
  State<PageView> createState() => _PageViewState();
}

class _PageViewState extends BaseState<PageView> {
  PageViewModel? viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<PageViewModel>(
      onPageBuilder: (context, value) => scaffoldBody,
      viewModel: PageViewModel(),
      onModelReady: (model) {
        viewModel = model;
      },
    );
  }

  Widget get scaffoldBody => Scaffold(
        floatingActionButton:
            FloatingActionButton(onPressed: () => viewModel?.incrementNumber()),
        body: textNumber,
      );

  Widget get textNumber {
    return Observer(builder: (_) {
      return Text(viewModel!.number.toString());
    });
  }
}
