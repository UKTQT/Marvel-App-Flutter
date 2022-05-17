import 'package:flutter/foundation.dart';

import '../model/characters_model.dart';
import '../service/characters_service.dart' as _characterService;
import '../service/comics_service.dart' as _comicService;

class CharacterViewModel with ChangeNotifier {
  static List<CharacterResult>? characterItems;
  // static List<Result>? characterComicsItems;

  static final _characterService.CharacterService characterService =
      _characterService.CharacterService();

  static final _comicService.ComicService comicService =
      _comicService.ComicService();

  static Future<void> fetchCharacterItems() async {
    characterItems =
        await CharacterViewModel.characterService.fetchCharacterItems();

    /* characterItems?.forEach(
      (element) {
        if (element.thumbnail!.path!.contains('image_not_available')) {
          characterItems!.removeAt(element.id!);
        }
      },
    ); */

    return characterItems!.shuffle();
  }

  /*  static Future<void> fetchCharacterComicsItems() async {
    characterComicsItems =
        await CharacterViewModel.comicService.fetchCharacterComics(id: 5454);
  } */
}


/* 
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../model/characters_model.dart';
import '../service/characters_service.dart';

class CharacterViewModel with ChangeNotifier {
  final CharacterService _characterService = CharacterService();
  List<Result> _characterItems = [];

  List<Result> get characterItems => _characterItems;

  setCharacterItems(List<Result> characterItems) {
    _characterItems = characterItems;
  }

  fetchCharacterItems() async {
    var response = await _characterService.fetchCharacterItems();

    setCharacterItems(response!);
    /*  characterItems =
        await CharacterViewModel._characterService.fetchCharacterItems(); */

    //return characterItems!.shuffle();
  }
}


*/
