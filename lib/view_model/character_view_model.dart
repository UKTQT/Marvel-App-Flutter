import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../model/characters_model.dart';
import '../model/comics_model.dart';
import '../service/characters_service.dart';
import '../view/character_view.dart';
import '../view/home_view.dart';

abstract class CharacterViewModel extends State<HomeView> {
  late final CharacterService characterService;

  bool isLoading = false;

  List<CharacterResult>? characterItems = [];

  List<ComicResult>? characterComicsItems = [];

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    super.initState();
    characterService = CharacterService();
    fetchCharacterItems(); // Character get
  }

  fetchCharacterItems() async {
    changeLoading();
    characterItems = await characterService.fetchCharacterItems() ?? [];
    changeLoading();
  }

  fetchCharacterComicsItems(int id) async {
    characterComicsItems = await characterService.fetchCharacterComics(id: id);
  }
}
