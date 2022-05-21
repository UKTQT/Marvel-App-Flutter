import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';

import '../model/series_model.dart';
import 'config.dart';

enum _ServicePaths { series }

abstract class ISeriesService {
  late final Dio _dio;

  ISeriesService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://gateway.marvel.com/v1/public/',
      ),
    );
  }

  Future<List<SeriesResult>?> fetchSeriesItems();
}

class SeriesService extends ISeriesService {
  @override
  Future<List<SeriesResult>?> fetchSeriesItems() async {
    try {
      var rndOffset = Random().nextInt(8000);
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
          return SeriesData.fromMap(_datas['data']).results;
        }
      }
    } on DioError catch (e) {}
  }
}
