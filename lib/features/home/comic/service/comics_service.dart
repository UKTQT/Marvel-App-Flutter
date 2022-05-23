import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';

import '../model/comics_model.dart';
import '../../../../core/init/network/config.dart';

enum _ServicePaths { comics }

abstract class IComicService {
  late final Dio _dio;

  IComicService() {
    _dio = Dio(BaseOptions(baseUrl: 'http://gateway.marvel.com/v1/public/'));
  }

  Future<List<ComicResult>?> fetchComicItems();
}

class ComicService extends IComicService {
  @override
  Future<List<ComicResult>?> fetchComicItems() async {
    try {
      var rndOffset = Random().nextInt(10000);
      final response = await _dio.get(
        _ServicePaths.comics.name,
        queryParameters: {
          'apikey': Config.publicKey,
          'ts': Config.timeStamp,
          'hash': Config.md5Hash,
          'limit': 100,
          'offset': rndOffset
        },
      );

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is Map<String, dynamic>) {
          return ComicData.fromMap(_datas['data']).results;
        }
      }
    } on DioError catch (e) {
      //
    }
    return null;
  }
}
