// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SeriesViewModel on _SeriesViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_SeriesViewModelBase.isLoading', context: context);

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

  late final _$seriesItemsAtom =
      Atom(name: '_SeriesViewModelBase.seriesItems', context: context);

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

  late final _$fetchSeriesItemsAsyncAction =
      AsyncAction('_SeriesViewModelBase.fetchSeriesItems', context: context);

  @override
  Future<List<SeriesResult>?> fetchSeriesItems() {
    return _$fetchSeriesItemsAsyncAction.run(() => super.fetchSeriesItems());
  }

  late final _$_SeriesViewModelBaseActionController =
      ActionController(name: '_SeriesViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_SeriesViewModelBaseActionController.startAction(
        name: '_SeriesViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_SeriesViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
seriesItems: ${seriesItems}
    ''';
  }
}
