import 'dart:io';

import 'package:dio/dio.dart';
import 'package:marvel/vb/base/base_model.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    if (_instance == null) _instance = NetworkManager._init();
    return _instance;
  }

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: 'ewqewq',
    );
    _dio = Dio(baseOptions);
  }

  Dio? _dio;

  Future dioGet<T extends BaseModel>(String path, T model) async {
    final response = await _dio?.get(path);

    switch (response?.statusCode) {
      case HttpStatus.ok:
        final responseBody = response?.data;

        if (responseBody is List) {
          return responseBody.map((e) => model.toJson(e)).toList();
        } else if (responseBody is Map) {
        } else {
          return responseBody;
        }
        break;
      default:
    }
  }
}
