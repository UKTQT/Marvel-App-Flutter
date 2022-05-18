import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';

import '../model/characters_model.dart';
import '../model/comics_model.dart';
import 'config.dart';

enum _ServicePaths { characters, comics }

abstract class ICharacterService {
  Future<List<CharacterResult>?> fetchCharacterItems();
  Future<List<ComicResult>?> fetchCharacterComics({int? id});
}

class CharacterService implements ICharacterService {
  late final Dio _dio;

  CharacterService()
      : _dio =
            Dio(BaseOptions(baseUrl: 'http://gateway.marvel.com/v1/public/'));

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
      print(e);
    }
    return null;
  }

  @override
  Future<List<ComicResult>?> fetchCharacterComics({int? id}) async {
    try {
      print('try çalıştı');

      final response2 = await _dio.get(
        _ServicePaths.characters.name +
            '/' +
            id.toString() +
            '/' +
            _ServicePaths.comics.name,
        queryParameters: {
          'apikey': Config.publicKey,
          'ts': Config.timeStamp,
          'hash': Config.md5Hash,
        },
      );
      print(response2.statusCode);
      if (response2.statusCode == HttpStatus.ok) {
        final _datas = response2.data;

        if (_datas is Map<String, dynamic>) {
          return ComicData.fromMap(_datas['data']).results;
        }
      }
    } on DioError catch (e) {
      print(e);
    }
    return null;
  }
}
