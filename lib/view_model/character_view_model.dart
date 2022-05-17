import 'package:flutter/foundation.dart';
import 'package:marvel/model/comics_model.dart';

import '../model/characters_model.dart';
import '../service/characters_service.dart';
import '../service/comics_service.dart';

class CharacterViewModel with ChangeNotifier {
  static List<Result>? characterItems;
  static List<Result>? characterComicsItems;

  static final CharacterService characterService = CharacterService();
  static final ComicService comicService = ComicService();

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

  static Future<void> fetchCharacterComicsItems() async {
    characterComicsItems =
        await CharacterViewModel.comicService.fetchCharacterComics(id: 5454);
  }
}
