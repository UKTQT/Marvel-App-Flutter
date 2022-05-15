import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';

import '../model/characters_model.dart';
import 'config.dart';

enum _ServicePaths {
  characters,
}

abstract class ICharacterService {
  Future<List<Result>?> fetchCharacterItems();
}

class CharacterService implements ICharacterService {
  late final Dio _dio;

  CharacterService()
      : _dio =
            Dio(BaseOptions(baseUrl: 'http://gateway.marvel.com/v1/public/'));

  @override
  Future<List<Result>?> fetchCharacterItems() async {
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
          return Data.fromMap(_datas['data']).results;
        }
      }
    } on DioError catch (e) {
      print(e);
    }
    return null;
  }
}
