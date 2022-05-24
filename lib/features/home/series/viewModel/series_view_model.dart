import 'package:mobx/mobx.dart';

import '../model/series_model.dart';
import '../service/series_service.dart';

part 'series_view_model.g.dart';

class SeriesViewModel = _SeriesViewModelBase with _$SeriesViewModel;

abstract class _SeriesViewModelBase with Store {
  final SeriesService seriesService = SeriesService();

  _SeriesViewModelBase() {}

  @observable //Değişebilir
  bool isLoading = false;

  @action //Ekrana haber verecek
  void changeLoading() {
    isLoading = !isLoading;
  }
}
