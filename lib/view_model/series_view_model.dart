import 'package:mobx/mobx.dart';

import '../model/series_model.dart';
import '../service/series_service.dart';

part 'series_view_model.g.dart';

class SeriesViewModel = _SeriesViewModelBase with _$SeriesViewModel;

abstract class _SeriesViewModelBase with Store {
  final SeriesService seriesService = SeriesService();

  _SeriesViewModelBase() {
    fetchSeriesItems();
  }

  @observable //Değişebilir
  bool isLoading = false;

  @observable
  List<SeriesResult>? seriesItems = [];

  @action //Ekrana haber verecek
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<List<SeriesResult>?> fetchSeriesItems() async {
    changeLoading();
    seriesItems = await seriesService.fetchSeriesItems() ?? [];
  }
}
