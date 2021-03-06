// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterViewModel on _CharacterViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_CharacterViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$characterComicsItemsAtom = Atom(
      name: '_CharacterViewModelBase.characterComicsItems', context: context);

  @override
  List<ComicResult>? get characterComicsItems {
    _$characterComicsItemsAtom.reportRead();
    return super.characterComicsItems;
  }

  @override
  set characterComicsItems(List<ComicResult>? value) {
    _$characterComicsItemsAtom.reportWrite(value, super.characterComicsItems,
        () {
      super.characterComicsItems = value;
    });
  }

  late final _$characterSeriesItemsAtom = Atom(
      name: '_CharacterViewModelBase.characterSeriesItems', context: context);

  @override
  List<SeriesResult>? get characterSeriesItems {
    _$characterSeriesItemsAtom.reportRead();
    return super.characterSeriesItems;
  }

  @override
  set characterSeriesItems(List<SeriesResult>? value) {
    _$characterSeriesItemsAtom.reportWrite(value, super.characterSeriesItems,
        () {
      super.characterSeriesItems = value;
    });
  }

  late final _$characterEventsItemsAtom = Atom(
      name: '_CharacterViewModelBase.characterEventsItems', context: context);

  @override
  List<EventResult>? get characterEventsItems {
    _$characterEventsItemsAtom.reportRead();
    return super.characterEventsItems;
  }

  @override
  set characterEventsItems(List<EventResult>? value) {
    _$characterEventsItemsAtom.reportWrite(value, super.characterEventsItems,
        () {
      super.characterEventsItems = value;
    });
  }

  late final _$fetchCharacterComicsItemsAsyncAction = AsyncAction(
      '_CharacterViewModelBase.fetchCharacterComicsItems',
      context: context);

  @override
  Future<List<ComicResult>?> fetchCharacterComicsItems(
      {required int? characterId}) {
    return _$fetchCharacterComicsItemsAsyncAction
        .run(() => super.fetchCharacterComicsItems(characterId: characterId));
  }

  late final _$fetchCharacterSeriesItemsAsyncAction = AsyncAction(
      '_CharacterViewModelBase.fetchCharacterSeriesItems',
      context: context);

  @override
  Future<List<SeriesResult>?> fetchCharacterSeriesItems(
      {required int? characterId}) {
    return _$fetchCharacterSeriesItemsAsyncAction
        .run(() => super.fetchCharacterSeriesItems(characterId: characterId));
  }

  late final _$fetchCharacterEventsItemsAsyncAction = AsyncAction(
      '_CharacterViewModelBase.fetchCharacterEventsItems',
      context: context);

  @override
  Future<List<EventResult>?> fetchCharacterEventsItems(
      {required int? characterId}) {
    return _$fetchCharacterEventsItemsAsyncAction
        .run(() => super.fetchCharacterEventsItems(characterId: characterId));
  }

  late final _$_CharacterViewModelBaseActionController =
      ActionController(name: '_CharacterViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_CharacterViewModelBaseActionController.startAction(
        name: '_CharacterViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_CharacterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
characterComicsItems: ${characterComicsItems},
characterSeriesItems: ${characterSeriesItems},
characterEventsItems: ${characterEventsItems}
    ''';
  }
}
