import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../model/characters_model.dart';
import '../model/comics_model.dart';
import '../service/characters_service.dart';
import '../view/character_view.dart';
import '../view/home_view.dart';

part 'character_view_model.g.dart';

class CharacterViewModel = _CharacterViewModelBase with _$CharacterViewModel;

abstract class _CharacterViewModelBase with Store {
  final CharacterService characterService = CharacterService();

  @observable
  PageState pageState = PageState.NORMAL;

  @observable //Değişebilir
  bool isLoading = false;

  @observable
  List<CharacterResult>? characterItems = [];

  List<ComicResult>? characterComicsItems = [];

  @action //Ekrana haber verecek
  void changeLoading() {
    isLoading = !isLoading;
  }

  @override
  void init() {
    fetchCharacterItems();
  }

  @action
  Future<List<CharacterResult>?> fetchCharacterItems() async {
    changeLoading();
    characterItems = await characterService.fetchCharacterItems() ?? [];
  }

  fetchCharacterComicsItems(int id) async {
    characterComicsItems = await characterService.fetchCharacterComics(id: id);
  }
}

enum PageState { LOADING, ERROR, SUCCESS, NORMAL }
