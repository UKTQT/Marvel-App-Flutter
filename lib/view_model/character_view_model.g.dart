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

  late final _$characterItemsAtom =
      Atom(name: '_CharacterViewModelBase.characterItems', context: context);

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

  late final _$fetchCharacterItemsAsyncAction = AsyncAction(
      '_CharacterViewModelBase.fetchCharacterItems',
      context: context);

  @override
  Future<List<CharacterResult>?> fetchCharacterItems() {
    return _$fetchCharacterItemsAsyncAction
        .run(() => super.fetchCharacterItems());
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
characterItems: ${characterItems}
    ''';
  }
}
