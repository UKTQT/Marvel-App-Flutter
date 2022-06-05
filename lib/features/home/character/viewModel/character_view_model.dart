import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../comic/model/comics_model.dart';
import '../../event/model/events_model.dart';
import '../../series/model/series_model.dart';
import '../service/characters_service.dart';

part 'character_view_model.g.dart';

class CharacterViewModel = _CharacterViewModelBase with _$CharacterViewModel;

enum listStatus { LOADING, EMPTY, FULL }

abstract class _CharacterViewModelBase with Store, BaseViewModel {
  final CharacterService _characterService = CharacterService();

  @override
  void init({int? id}) {
    fetchCharacterComicsItems(characterId: id);
    fetchCharacterSeriesItems(characterId: id);
    fetchCharacterEventsItems(characterId: id);
  }

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
  bool comicsItemsIsLoading = false;

  @observable
  List<SeriesResult>? characterSeriesItems = [];
  @observable
  bool seriesItemsIsLoading = false;

  @observable
  List<EventResult>? characterEventsItems = [];
  @observable
  bool eventsItemsIsLoading = false;

  @action
  Future<List<ComicResult>?> fetchCharacterComicsItems(
      {required int? characterId}) async {
    comicsItemsIsLoading = true;
    characterComicsItems =
        await _characterService.fetchCharacterComics(id: characterId) ?? [];
    comicsItemsIsLoading = false;
  }

  @action
  Future<List<SeriesResult>?> fetchCharacterSeriesItems(
      {required int? characterId}) async {
    seriesItemsIsLoading = true;
    characterSeriesItems =
        await _characterService.fetchCharacterSeries(id: characterId) ?? [];
    seriesItemsIsLoading = false;
  }

  @action
  Future<List<EventResult>?> fetchCharacterEventsItems(
      {required int? characterId}) async {
    eventsItemsIsLoading = true;
    characterEventsItems =
        await _characterService.fetchCharacterEvents(id: characterId) ?? [];
    eventsItemsIsLoading = false;
  }

  /*  @action
  Future<List<CharacterResult>?> fetchSingleCharacterItems(
      {required int characterId}) async {
    singleCharacterItems =
        await characterService.fetchSingleCharacterItems(id: characterId) ?? [];
  } */
}
