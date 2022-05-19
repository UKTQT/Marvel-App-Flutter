import 'package:flutter/material.dart';
import 'package:marvel/vb/base/base_state.dart';

class PageView extends StatefulWidget {
  const PageView({Key? key}) : super(key: key);

  @override
  State<PageView> createState() => _PageViewState();
}

class _PageViewState extends BaseState<PageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: dynamicHeight(0.1),
    );
  }
}
