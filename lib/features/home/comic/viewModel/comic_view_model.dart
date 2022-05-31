import 'package:flutter/material.dart';
import 'package:marvel/core/base/model/base_view_model.dart';
import 'package:marvel/features/home/character/model/characters_model.dart';
import 'package:mobx/mobx.dart';

import '../service/comics_service.dart';

part 'comic_view_model.g.dart';

class ComicViewModel = _ComicViewModelBase with _$ComicViewModel;

abstract class _ComicViewModelBase with Store, BaseViewModel {
  final ComicService comicService = ComicService();

  @override
  void init({int? id}) {}

  @override
  void setContext(BuildContext context) => this.baseViewContext = context;

  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @observable
  bool characterItemsIsLoading = false;
  @observable
  List<CharacterResult>? comicCharacterItems = [];
}
