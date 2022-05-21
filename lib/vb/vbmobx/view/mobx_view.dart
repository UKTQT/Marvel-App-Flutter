import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../viewmodel/mobx_view_model.dart';

class MobxView extends StatefulWidget {
  const MobxView({Key? key}) : super(key: key);

  @override
  State<MobxView> createState() => _MobxViewState();
}

class _MobxViewState extends State<MobxView> {
  final _mobxViewModel = MobxViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Observer(builder: (_) {
        return _mobxViewModel.isLoading
            ? Text('ewq')
            : Text('${_mobxViewModel}');
      }),
    );
  }
}



//RestFul Mobx