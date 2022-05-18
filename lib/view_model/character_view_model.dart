import 'package:flutter/foundation.dart';
import 'package:marvel/model/comics_model.dart';

import '../model/characters_model.dart';
import '../service/characters_service.dart';

class CharacterViewModel with ChangeNotifier {
  static List<CharacterResult>? characterItems;
  static List<ComicResult>? characterComicsItems;

  static final CharacterService characterService = CharacterService();

  static Future<void> fetchCharacterItems() async {
    characterItems = await characterService.fetchCharacterItems();

    return characterItems!.shuffle();
  }

  static Future<void> fetchCharacterComicsItems(int id) async {
    characterComicsItems = await characterService.fetchCharacterComics(id: id);
  }
}
