import 'package:mobx/mobx.dart';

import '../model/characters_model.dart';
import '../model/comics_model.dart';
import '../service/characters_service.dart';

class CharacterViewModel with Store {
  static List<CharacterResult>? characterItems;

  static List<ComicResult>? characterComicsItems;

  static final CharacterService characterService = CharacterService();

  @observable
  static bool isLoading = false;

  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> fetchCharacterItems() async {
    changeLoading();
    characterItems = await characterService.fetchCharacterItems();
    changeLoading();
  }

  @action
  Future<void> fetchCharacterComicsItems(int id) async {
    characterComicsItems = await characterService.fetchCharacterComics(id: id);
  }
}
