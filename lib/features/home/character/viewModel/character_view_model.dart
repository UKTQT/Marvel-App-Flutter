import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../model/characters_model.dart';
import '../../comic/model/comics_model.dart';
import '../../../../model/events_model.dart';
import '../../series/model/series_model.dart';
import '../service/characters_service.dart';
import '../view/character_view.dart';
import '../../home/view/home_view.dart';

part 'character_view_model.g.dart';

class CharacterViewModel = _CharacterViewModelBase with _$CharacterViewModel;

abstract class _CharacterViewModelBase with Store {
  final CharacterService characterService = CharacterService();

  _CharacterViewModelBase() {
    fetchCharacterItems();
  }

  @observable //Değişebilir
  bool isLoading = false;

  @observable
  List<CharacterResult>? characterItems = [];

  @observable
  List<CharacterResult>? singleCharacterItems = [];

  @observable
  List<ComicResult>? characterComicsItems = [];

  @observable
  List<SeriesResult>? characterSeriesItems = [];

  @observable
  List<EventResult>? characterEventsItems = [];

  @action //Ekrana haber verecek
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<List<CharacterResult>?> fetchCharacterItems() async {
    changeLoading();
    characterItems = await characterService.fetchCharacterItems() ?? [];
  }

  /*  @action
  Future<List<CharacterResult>?> fetchSingleCharacterItems(
      {required int characterId}) async {
    singleCharacterItems =
        await characterService.fetchSingleCharacterItems(id: characterId) ?? [];
  } */

  @action
  Future<List<ComicResult>?> fetchCharacterComicsItems(
      {required int characterId}) async {
    characterComicsItems =
        await characterService.fetchCharacterComics(id: characterId) ?? [];
  }

  @action
  Future<List<SeriesResult>?> fetchCharacterSeriesItems(
      {required int characterId}) async {
    characterSeriesItems =
        await characterService.fetchCharacterSeries(id: characterId) ?? [];
  }

  @action
  Future<List<EventResult>?> fetchCharacterEventsItems(
      {required int characterId}) async {
    characterEventsItems =
        await characterService.fetchCharacterEvents(id: characterId) ?? [];
  }
}
