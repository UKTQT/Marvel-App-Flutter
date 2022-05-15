import 'package:flutter/foundation.dart';

import '../model/characters_model.dart';
import '../service/characters_service.dart';

class CharacterViewModel with ChangeNotifier {
  static List<Result>? characterItems;
  static final CharacterService characterService = CharacterService();

  static Future<void> fetchCharacterItems() async {
    characterItems =
        await CharacterViewModel.characterService.fetchCharacterItems();

    characterItems?.forEach(
      (element) {
        if (element.thumbnail!.path!.contains('image_not_available')) {
          characterItems!.removeAt(element.id!);
        }
      },
    );

    return characterItems!.shuffle();
  }
}
