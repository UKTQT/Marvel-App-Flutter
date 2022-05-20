import 'dart:io';

import 'package:dio/dio.dart';
import 'package:marvel/vb/vb2022/model/reqres_model.dart';

abstract class IReqresService {
  final Dio dio;

  IReqresService(this.dio);

  Future<List<ReqresModel>?> fetchResourceItem();
}

class ReqresService extends IReqresService {
  ReqresService(Dio dio) : super(dio);

  @override
  Future<List<ReqresModel>?> fetchResourceItem() async {
    final response = await dio.get('posts');

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;

      if (jsonBody is List) {
        return jsonBody.map((e) => ReqresModel.fromJson(e)).toList();
      }
    }
  }
}
