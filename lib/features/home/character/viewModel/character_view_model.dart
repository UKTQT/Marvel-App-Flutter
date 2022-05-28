import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../home/view/home_view.dart';
import '../../comic/model/comics_model.dart';
import '../../event/model/events_model.dart';
import '../../series/model/series_model.dart';
import '../model/characters_model.dart';
import '../service/characters_service.dart';
import '../view/character_view.dart';

part 'character_view_model.g.dart';

class CharacterViewModel = _CharacterViewModelBase with _$CharacterViewModel;

abstract class _CharacterViewModelBase with Store, BaseViewModel {
  final CharacterService _characterService = CharacterService();

  @override
  void init() {}

  @override
  void setContext(BuildContext context) => this.baseViewContext = context;

  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  /* @observable
  List<CharacterResult>? singleCharacterItems = []; */

  @observable
  List<ComicResult>? characterComicsItems = [];

  @observable
  List<SeriesResult>? characterSeriesItems = [];

  @observable
  List<EventResult>? characterEventsItems = [];

  @action
  Future<List<ComicResult>?> fetchCharacterComicsItems(
      {required int characterId}) async {
    characterComicsItems =
        await _characterService.fetchCharacterComics(id: characterId) ?? [];
  }

  @action
  Future<List<SeriesResult>?> fetchCharacterSeriesItems(
      {required int characterId}) async {
    characterSeriesItems =
        await _characterService.fetchCharacterSeries(id: characterId) ?? [];
  }

  @action
  Future<List<EventResult>?> fetchCharacterEventsItems(
      {required int characterId}) async {
    characterEventsItems =
        await _characterService.fetchCharacterEvents(id: characterId) ?? [];
  }

  /*  @action
  Future<List<CharacterResult>?> fetchSingleCharacterItems(
      {required int characterId}) async {
    singleCharacterItems =
        await characterService.fetchSingleCharacterItems(id: characterId) ?? [];
  } */
}
