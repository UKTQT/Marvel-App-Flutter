// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$searchItemsAtom =
      Atom(name: '_HomeViewModelBase.searchItems', context: context);

  @override
  String get searchItems {
    _$searchItemsAtom.reportRead();
    return super.searchItems;
  }

  @override
  set searchItems(String value) {
    _$searchItemsAtom.reportWrite(value, super.searchItems, () {
      super.searchItems = value;
    });
  }

  late final _$characterItemsIsLoadingAtom = Atom(
      name: '_HomeViewModelBase.characterItemsIsLoading', context: context);

  @override
  bool get characterItemsIsLoading {
    _$characterItemsIsLoadingAtom.reportRead();
    return super.characterItemsIsLoading;
  }

  @override
  set characterItemsIsLoading(bool value) {
    _$characterItemsIsLoadingAtom
        .reportWrite(value, super.characterItemsIsLoading, () {
      super.characterItemsIsLoading = value;
    });
  }

  late final _$characterItemsAtom =
      Atom(name: '_HomeViewModelBase.characterItems', context: context);

  @override
  List<CharacterResult>? get characterItems {
    _$characterItemsAtom.reportRead();
    return super.characterItems;
  }

  @override
  set characterItems(List<CharacterResult>? value) {
    _$characterItemsAtom.reportWrite(value, super.characterItems, () {
      super.characterItems = value;
    });
  }

  late final _$comicItemsIsLoadingAtom =
      Atom(name: '_HomeViewModelBase.comicItemsIsLoading', context: context);

  @override
  bool get comicItemsIsLoading {
    _$comicItemsIsLoadingAtom.reportRead();
    return super.comicItemsIsLoading;
  }

  @override
  set comicItemsIsLoading(bool value) {
    _$comicItemsIsLoadingAtom.reportWrite(value, super.comicItemsIsLoading, () {
      super.comicItemsIsLoading = value;
    });
  }

  late final _$comicItemsAtom =
      Atom(name: '_HomeViewModelBase.comicItems', context: context);

  @override
  List<ComicResult>? get comicItems {
    _$comicItemsAtom.reportRead();
    return super.comicItems;
  }

  @override
  set comicItems(List<ComicResult>? value) {
    _$comicItemsAtom.reportWrite(value, super.comicItems, () {
      super.comicItems = value;
    });
  }

  late final _$seriesItemsIsLoadingAtom =
      Atom(name: '_HomeViewModelBase.seriesItemsIsLoading', context: context);

  @override
  bool get seriesItemsIsLoading {
    _$seriesItemsIsLoadingAtom.reportRead();
    return super.seriesItemsIsLoading;
  }

  @override
  set seriesItemsIsLoading(bool value) {
    _$seriesItemsIsLoadingAtom.reportWrite(value, super.seriesItemsIsLoading,
        () {
      super.seriesItemsIsLoading = value;
    });
  }

  late final _$seriesItemsAtom =
      Atom(name: '_HomeViewModelBase.seriesItems', context: context);

  @override
  List<SeriesResult>? get seriesItems {
    _$seriesItemsAtom.reportRead();
    return super.seriesItems;
  }

  @override
  set seriesItems(List<SeriesResult>? value) {
    _$seriesItemsAtom.reportWrite(value, super.seriesItems, () {
      super.seriesItems = value;
    });
  }

  late final _$fetchCharacterItemsAsyncAction =
      AsyncAction('_HomeViewModelBase.fetchCharacterItems', context: context);

  @override
  Future<List<CharacterResult>?> fetchCharacterItems() {
    return _$fetchCharacterItemsAsyncAction
        .run(() => super.fetchCharacterItems());
  }

  late final _$fetchComicItemsAsyncAction =
      AsyncAction('_HomeViewModelBase.fetchComicItems', context: context);

  @override
  Future<List<ComicResult>?> fetchComicItems() {
    return _$fetchComicItemsAsyncAction.run(() => super.fetchComicItems());
  }

  late final _$fetchSeriesItemsAsyncAction =
      AsyncAction('_HomeViewModelBase.fetchSeriesItems', context: context);

  @override
  Future<List<SeriesResult>?> fetchSeriesItems() {
    return _$fetchSeriesItemsAsyncAction.run(() => super.fetchSeriesItems());
  }

  @override
  String toString() {
    return '''
searchItems: ${searchItems},
characterItemsIsLoading: ${characterItemsIsLoading},
characterItems: ${characterItems},
comicItemsIsLoading: ${comicItemsIsLoading},
comicItems: ${comicItems},
seriesItemsIsLoading: ${seriesItemsIsLoading},
seriesItems: ${seriesItems}
    ''';
  }
}
