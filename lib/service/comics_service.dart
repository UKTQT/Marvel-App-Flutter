import 'dart:io';

import 'package:dio/dio.dart';

import '../model/comics_model.dart';
import 'config.dart';

enum _ServicePaths { comics }

abstract class IComicService {
  Future<List<ComicResult>?> fetchComicItems();
}

class ComicService implements IComicService {
  late final Dio _dio;

  ComicService()
      : _dio =
            Dio(BaseOptions(baseUrl: 'http://gateway.marvel.com/v1/public/'));

  @override
  Future<List<ComicResult>?> fetchComicItems() async {
    try {
      final response = await _dio.get(
        _ServicePaths.comics.name,
        queryParameters: {
          'apikey': Config.publicKey,
          'ts': Config.timeStamp,
          'hash': Config.md5Hash,
        },
      );

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is Map<String, dynamic>) {
          return ComicData.fromMap(_datas['data']).results;
        }
      }
    } on DioError catch (e) {}
    return null;
  }
}
