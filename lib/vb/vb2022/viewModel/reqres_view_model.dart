import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marvel/vb/vb2022/model/reqres_model.dart';
import 'package:marvel/vb/vb2022/service/service.dart';

import '../view/reqres_view.dart';

abstract class ReqResViewModel extends State<ReqResView> {
  late final IReqresService reqresService;

  bool isLoading = false;

  List<ReqresModel> resources = [];

  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(
      Dio(
        BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'),
      ),
    );

    _fetch();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void _fetch() async {
    changeLoading();
    resources = await reqresService.fetchResourceItem() ?? [];
    changeLoading();
  }
}
