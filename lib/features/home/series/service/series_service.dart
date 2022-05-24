import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';

import '../model/series_model.dart';
import '../../../../core/init/network/config.dart';

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
}

class SeriesService extends ISeriesService {}
