import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';

import '../../character/model/characters_model.dart';
import '../../comic/model/comics_model.dart';
import '../../event/model/events_model.dart';
import '../../series/model/series_model.dart';
import '../../../../core/init/network/config.dart';

enum _ServicePaths { characters, comics, series, events }

abstract class IHomeService {
  late final Dio _dio;

  IHomeService() {
    _dio = Dio(BaseOptions(baseUrl: 'http://gateway.marvel.com/v1/public/'));
  }

  Future<List<CharacterResult>?> fetchCharacterItems();
  Future<List<ComicResult>?> fetchComicItems();
  Future<List<SeriesResult>?> fetchSeriesItems();
}

class HomeService extends IHomeService {
  @override
  Future<List<CharacterResult>?> fetchCharacterItems() async {
    try {
      var rndOffset = Random().nextInt(1000);
      final response = await _dio.get(
        _ServicePaths.characters.name,
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
          return CharacterData.fromMap(_datas['data']).results;
        }
      }
    } on DioError catch (e) {
      //
    }
    return null;
  }

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
    } on DioError catch (e) {
      //
    }
    return null;
  }
}
