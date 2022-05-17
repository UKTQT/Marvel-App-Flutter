import 'dart:io';

import 'package:dio/dio.dart';

import '../model/comics_model.dart';
import 'config.dart';

enum _ServicePaths { comics, characters }

abstract class IComicService {
  Future<List<Result>?> fetchComicItems();
  Future<List<Result>?> fetchCharacterComics({int? id});
}

class ComicService implements IComicService {
  late final Dio _dio;

  ComicService()
      : _dio =
            Dio(BaseOptions(baseUrl: 'http://gateway.marvel.com/v1/public/'));

  @override
  Future<List<Result>?> fetchComicItems() async {
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
          return Data.fromMap(_datas['data']).results;
        }
      }
    } on DioError catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Future<List<Result>?> fetchCharacterComics({int? id}) async {
    try {
      final response = await _dio.get(
        _ServicePaths.characters.name +
            '/' +
            id.toString() +
            '/' +
            _ServicePaths.comics.name,
        queryParameters: {
          'apiKey': Config.publicKey,
          'ts': Config.timeStamp,
          'hash': Config.md5Hash,
        },
      );

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is Map<String, dynamic>) {
          return Data.fromMap(_datas['data']).results;
        }
      }
    } on DioError catch (e) {
      print(e);
    }
    return null;
  }
}
