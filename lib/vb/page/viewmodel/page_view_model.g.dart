// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PageViewModel on _PageViewModelBase, Store {
  late final _$numberAtom =
      Atom(name: '_PageViewModelBase.number', context: context);

  @override
  int get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(int value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  late final _$_PageViewModelBaseActionController =
      ActionController(name: '_PageViewModelBase', context: context);

  @override
  void incrementNumber() {
    final _$actionInfo = _$_PageViewModelBaseActionController.startAction(
        name: '_PageViewModelBase.incrementNumber');
    try {
      return super.incrementNumber();
    } finally {
      _$_PageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
number: ${number}
    ''';
  }
}
