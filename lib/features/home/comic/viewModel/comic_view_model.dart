import 'package:flutter/material.dart';
import 'package:marvel/core/base/model/base_view_model.dart';
import 'package:marvel/features/home/character/model/characters_model.dart';
import 'package:marvel/features/home/creator/model/creators_model.dart';
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
    fetchComicEventItems(comicId: id);
    fetchComicCreatorItems(comicId: id);
  }

  @override
  void setContext(BuildContext context) => this.baseViewContext = context;

  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  //---------------
  @observable
  bool characterItemsIsLoading = false;
  @observable
  List<CharacterResult>? comicCharacterItems = [];

  @action
  Future<List<CharacterResult>?> fetchComicCharacterItems(
      {required int? comicId}) async {
    characterItemsIsLoading = true;
    comicCharacterItems =
        await _comicService.fetchComicCharacterItems(id: comicId) ?? [];
    characterItemsIsLoading = false;
  }

  //---------------
  @observable
  bool eventItemsIsLoading = false;
  @observable
  List<EventResult>? comicEventItems = [];

  @action
  Future<List<EventResult>?> fetchComicEventItems(
      {required int? comicId}) async {
    eventItemsIsLoading = true;
    comicEventItems =
        await _comicService.fetchComicEventsItems(id: comicId) ?? [];
    eventItemsIsLoading = false;
  }

  //---------------
  @observable
  bool creatorItemsIsLoading = false;
  @observable
  List<CreatorResult>? comicCreatorItems = [];

  @action
  Future<List<CreatorResult>?> fetchComicCreatorItems(
      {required int? comicId}) async {
    creatorItemsIsLoading = true;
    comicCreatorItems =
        await _comicService.fetchComicCreatorItems(id: comicId) ?? [];
    creatorItemsIsLoading = false;
  }
  //---------------
}
