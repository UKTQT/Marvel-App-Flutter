abstract class ISplashService {}

class SplashService extends ISplashService {
  static final SplashService _instance = SplashService._init();
  static SplashService get instance => _instance;

  SplashService._init();
}
