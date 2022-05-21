// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobxViewModel on _MobxViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_MobxViewModelBase.isLoading', context: context);

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

  late final _$resourcesAtom =
      Atom(name: '_MobxViewModelBase.resources', context: context);

  @override
  List<ReqresModelMobx> get resources {
    _$resourcesAtom.reportRead();
    return super.resources;
  }

  @override
  set resources(List<ReqresModelMobx> value) {
    _$resourcesAtom.reportWrite(value, super.resources, () {
      super.resources = value;
    });
  }

  late final _$fetchItemsAsyncAction =
      AsyncAction('_MobxViewModelBase.fetchItems', context: context);

  @override
  Future<List<ReqresModelMobx>?> fetchItems() {
    return _$fetchItemsAsyncAction.run(() => super.fetchItems());
  }

  late final _$_MobxViewModelBaseActionController =
      ActionController(name: '_MobxViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_MobxViewModelBaseActionController.startAction(
        name: '_MobxViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_MobxViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
resources: ${resources}
    ''';
  }
}
