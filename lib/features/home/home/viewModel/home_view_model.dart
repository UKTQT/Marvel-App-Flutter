import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../character/model/characters_model.dart';
import '../../comic/model/comics_model.dart';
import '../../series/model/series_model.dart';
import '../service/home_service.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  final HomeService _homeService = HomeService();

  @override
  void init() {
    fetchCharacterItems();
    fetchComicItems();
    fetchSeriesItems();
  }

  @override
  void setContext(BuildContext context) => this.baseViewContext = context;

  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @observable
  String searchItems = '';

  //There are 3 sections on the homepage; Characters, Comics, Series

  @observable
  List<CharacterResult>? characterItems = [];

  @observable
  List<ComicResult>? comicItems = [];

  @observable
  List<SeriesResult>? seriesItems = [];

  @action
  Future<List<CharacterResult>?> fetchCharacterItems() async {
    changeLoading();
    characterItems = await _homeService.fetchCharacterItems() ?? [];
  }

  @action
  Future<List<ComicResult>?> fetchComicItems() async {
    changeLoading();
    comicItems = await _homeService.fetchComicItems() ?? [];
  }

  @action
  Future<List<SeriesResult>?> fetchSeriesItems() async {
    changeLoading();
    seriesItems = await _homeService.fetchSeriesItems() ?? [];
  }
}
