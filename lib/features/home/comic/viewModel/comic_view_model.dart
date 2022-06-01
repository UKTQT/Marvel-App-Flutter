import 'package:flutter/material.dart';
import 'package:marvel/core/base/model/base_view_model.dart';
import 'package:marvel/features/home/character/model/characters_model.dart';
import 'package:marvel/features/home/event/model/events_model.dart';
import 'package:mobx/mobx.dart';

import '../service/comics_service.dart';

part 'comic_view_model.g.dart';

class ComicViewModel = _ComicViewModelBase with _$ComicViewModel;

abstract class _ComicViewModelBase with Store, BaseViewModel {
  final ComicService _comicService = ComicService();

  @override
  void init({int? id}) {
    fetchComicCharacterItems(comicId: id);
  }

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

  @observable
  bool eventItemsIsLoading = false;
  @observable
  List<EventResult>? comicEventItems = [];

  @action
  Future<List<CharacterResult>?> fetchComicCharacterItems(
      {required int? comicId}) async {
    comicCharacterItems =
        await _comicService.fetchComicCharacterItems(id: comicId) ?? [];
  }

  @action
  Future<List<EventResult>?> fetchComicEventItems(
      {required int? comicId}) async {
    comicEventItems =
        await _comicService.fetchComicEventsItems(id: comicId) ?? [];
  }
}
