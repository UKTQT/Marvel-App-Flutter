import '../model/series_model.dart';
import '../service/series_service.dart';

class SeriesViewModel {
  static List<Result>? seriesItems;
  static final SeriesService seriesService = SeriesService();

  static Future<void> fetchSeriesItems() async {
    seriesItems = await seriesService.fetchSeriesItems();
    return seriesItems!.shuffle();
  }
}
