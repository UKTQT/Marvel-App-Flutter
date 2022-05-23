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

  @override
  String toString() {
    return '''
searchItems: ${searchItems}
    ''';
  }
}
