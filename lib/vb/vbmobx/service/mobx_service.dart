import 'dart:io';

import 'package:dio/dio.dart';

import '../model/mobx_model.dart';

abstract class IMobxService {
  final Dio dio;

  IMobxService(this.dio);

  Future<List<ReqresModelMobx>?> fetchResourceItem();
}

class MobxService extends IMobxService {
  MobxService(Dio dio) : super(dio);

  @override
  Future<List<ReqresModelMobx>?> fetchResourceItem() async {
    final response =
        await dio.get('posts', onReceiveProgress: (int get, int total) {});

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;

      if (jsonBody is List) {
        return jsonBody.map((e) => ReqresModelMobx.fromJson(e)).toList();
      }
    }
  }
}
