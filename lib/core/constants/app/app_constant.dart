class AppConstant {
  static AppConstant? _instance;
  static AppConstant? get instance {
    _instance ??= AppConstant._init();
    return _instance;
  }

  AppConstant._init();

  //Main Constants
  final String PROJECT_TITLE = 'Marvel';

  //Home View Characters
  final String HOME_VIEW_CHARACTER_BOX_TITLE = 'Characters';
  final String HOME_VIEW_CHARACTER_BOX_TITLE2 = 'All Characters';
  final String HOME_VIEW_SEARCH_INPUT_TEXT = 'Characters, Comics, Series..';
}
