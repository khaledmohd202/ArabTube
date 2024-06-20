import 'cache_helper.dart';

class CacheKeysManger {
  static bool onBoardingStatus() =>
      CacheHelper.getData(key: 'onBoarding') ?? false;
  static String tokenStatus() =>
      CacheHelper.getData(key: 'token') ?? "";
  static String? getUserLanguageFromCache() =>
      CacheHelper.getData(key: 'language')?? "fr";
}
