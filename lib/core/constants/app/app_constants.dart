class AppConstant {
  static AppConstant? _instance;
  static AppConstant? get instance {
    _instance ??= AppConstant._init();
    return _instance;
  }

  AppConstant._init();

  //Main Constants
  final String PROJECT_TITLE = 'Marvel';
  final String PROJECT_LOGO_PATH = 'assets/images/marvel-logo.png';
  //SplashView
  final String SPLASH_VIEW_GIF_PATH = 'assets/splash/splash_gif.gif';
  //HomeView
  final String HOME_VIEW_SEARCH_INPUT_TEXT = 'Characters, Comics, Series..';
  //Home View Characters
  final String HOME_VIEW_CHARACTER_BOX_TITLE = 'Characters';
  final String HOME_VIEW_CHARACTER_BOX_TITLE2 = 'All Characters';
  //Home View Characters
  final String HOME_VIEW_COMIC_BOX_TITLE = 'Comics';
  final String HOME_VIEW_COMIC_BOX_TITLE2 = 'All Comics';
  //Character View All Text
  final String CHARACTER_VIEW_DESCRIPTION_TEXT = 'Description';
  final String CHARACTER_VIEW_COMICS_TEXT = 'Comics';
  final String CHARACTER_VIEW_SERIES_TEXT = 'Series';
  final String CHARACTER_VIEW_EVENTS_TEXT = 'Events';
}
