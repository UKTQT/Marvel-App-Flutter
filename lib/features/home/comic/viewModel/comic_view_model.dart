import 'package:mobx/mobx.dart';

import '../service/comics_service.dart';

part 'comic_view_model.g.dart';

class ComicViewModel = _ComicViewModelBase with _$ComicViewModel;

abstract class _ComicViewModelBase with Store {
  final ComicService comicService = ComicService();

  _ComicViewModelBase() {}

  @observable //Değişebilir
  bool isLoading = false;

  @action //Ekrana haber verecek
  void changeLoading() {
    isLoading = !isLoading;
  }
}
