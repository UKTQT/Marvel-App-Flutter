// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ComicViewModel on _ComicViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ComicViewModelBase.isLoading', context: context);

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

  late final _$comicItemsAtom =
      Atom(name: '_ComicViewModelBase.comicItems', context: context);

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

  late final _$_ComicViewModelBaseActionController =
      ActionController(name: '_ComicViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_ComicViewModelBaseActionController.startAction(
        name: '_ComicViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_ComicViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
comicItems: ${comicItems}
    ''';
  }
}
