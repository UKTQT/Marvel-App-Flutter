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
}

class ComicService extends IComicService {}
