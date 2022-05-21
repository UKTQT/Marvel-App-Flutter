import 'package:dio/dio.dart';
import 'package:marvel/vb/vbmobx/service/mobx_service.dart';
import 'package:mobx/mobx.dart';

import '../model/mobx_model.dart';

part 'mobx_view_model.g.dart';

class MobxViewModel = _MobxViewModelBase with _$MobxViewModel;

abstract class _MobxViewModelBase with Store {
  static const _baseUrl = 'https://jsonplaceholder.typicode.com/';

  @observable //Değişebilir
  bool isLoading = false;

  @observable
  List<ReqresModelMobx> resources = [];

  MobxService mobxService = MobxService(
    Dio(
      BaseOptions(baseUrl: _baseUrl),
    ),
  );

  @action //Ekrana haber verecek
  void changeLoading() {
    isLoading = !isLoading;
  }

  void init() {}

  @action
  Future<List<ReqresModelMobx>?> fetchItems() async {
    changeLoading();
    resources = await mobxService.fetchResourceItem() ?? [];
    changeLoading();
  }
}
