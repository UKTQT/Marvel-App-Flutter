import 'package:flutter/material.dart';
import 'package:marvel/vb/vb2022/model/reqres_model.dart';
import 'package:marvel/vb/vb2022/service/service.dart';

class ReqResProviderVm extends ChangeNotifier {
  late final IReqresService reqresService;

  List<ReqresModel> resources = [];
  bool isLoading = false;

  ReqResProviderVm(this.reqresService) {
    _fetch();
  }

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void _fetch() async {
    _changeLoading();
    resources = await reqresService.fetchResourceItem() ?? [];
    _changeLoading();
  }
}
