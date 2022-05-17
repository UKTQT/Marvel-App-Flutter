import '../model/comics_model.dart';
import '../service/comics_service.dart';

class ComicViewModel {
  static List<ComicResult>? comicItems;
  static final ComicService comicService = ComicService();

  static Future<void> fetchComicItems() async {
    comicItems = await comicService.fetchComicItems();
  }
}
