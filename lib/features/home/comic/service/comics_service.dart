import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:marvel/features/home/event/model/events_model.dart';
import 'package:marvel/features/home/series/model/series_model.dart';

import '../../character/model/characters_model.dart';
import '../../../../core/init/network/config.dart';

enum _ServicePaths { characters, comics, series, events }

abstract class IComicService {
  late final Dio _dio;

  IComicService() {
    _dio = Dio(BaseOptions(baseUrl: 'http://gateway.marvel.com/v1/public/'));
  }

  Future<List<CharacterResult>?> fetchComicCharacterItems({required int? id});
  Future<List<EventResult>?> fetchComicEventsItems({required int? id});
}

class ComicService extends IComicService {
  //---------------
  @override
  Future<List<CharacterResult>?> fetchComicCharacterItems(
      {required int? id}) async {
    try {
      final response = await _dio.get(
        _ServicePaths.comics.name +
            '/' +
            id.toString() +
            '/' +
            _ServicePaths.characters.name,
        queryParameters: {
          'apikey': Config.publicKey,
          'ts': Config.timeStamp,
          'hash': Config.md5Hash
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

  //---------------
  @override
  Future<List<EventResult>?> fetchComicEventsItems({required int? id}) async {
    try {
      final response = await _dio.get(
        _ServicePaths.comics.name +
            '/' +
            id.toString() +
            '/' +
            _ServicePaths.events.name,
        queryParameters: {
          'apikey': Config.publicKey,
          'ts': Config.timeStamp,
          'hash': Config.md5Hash
        },
      );

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is Map<String, dynamic>) {
          return EventData.fromMap(_datas['data']).results;
        }
      }
    } on DioError catch (e) {
      //
    }
    return null;
  }
  //---------------
}
