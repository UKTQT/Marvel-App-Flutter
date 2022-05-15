import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';

import '../model/series_model.dart';
import 'config.dart';

enum _ServicePaths { series }

abstract class ISeriesService {
  Future<List<Result>?> fetchSeriesItems();
}

class SeriesService implements ISeriesService {
  late final Dio _dio;

  SeriesService()
      : _dio = Dio(BaseOptions(
          baseUrl: 'http://gateway.marvel.com/v1/public/',
        ));

  @override
  Future<List<Result>?> fetchSeriesItems() async {
    try {
      var rndOffset = Random().nextInt(1000);
      final response =
          await _dio.get(_ServicePaths.series.name, queryParameters: {
        'apikey': Config.publicKey,
        'ts': Config.timeStamp,
        'hash': Config.md5Hash,
        'limit': 100,
        'offset': rndOffset
      });

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is Map<String, dynamic>) {
          return Data.fromMap(_datas['data']).results;
        }
      }
    } on DioError catch (e) {}
  }
}
