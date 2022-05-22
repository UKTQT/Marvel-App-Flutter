import 'package:mobx/mobx.dart';

import '../model/comics_model.dart';
import '../service/comics_service.dart';

part 'comic_view_model.g.dart';

class ComicViewModel = _ComicViewModelBase with _$ComicViewModel;

abstract class _ComicViewModelBase with Store {
  final ComicService comicService = ComicService();

  _ComicViewModelBase() {
    fetchComicItems();
  }

  @observable //Değişebilir
  bool isLoading = false;

  @observable
  List<ComicResult>? comicItems = [];

  @action //Ekrana haber verecek
  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<List<ComicResult>?> fetchComicItems() async {
    changeLoading();
    comicItems = await comicService.fetchComicItems() ?? [];
  }
}
