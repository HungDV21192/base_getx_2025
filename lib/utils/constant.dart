class Base {
  static const String URL = 'https://api.lms-v2.slova.vn/api/';
  static const imagePath = 'assets/images';
  static const svgPath = 'assets/svg';
}

class Endpoint {
  static const String LOGIN = 'auth/login';
  static const String REGISTER = 'api/Register';
  static const String UPLOAD = 'upload/file';
}

class StorageKey {
  static const String ACCESS_TOKEN = 'LOGIN_MODEL';
  static const String USERNAME = 'USERNAME';
  static const String PASSWORD = 'PASSWORD';
}

class PrefsKey {
  static const String THEME_MODE = 'THEME_MODE';
  static const String LANGUAGE = 'LANGUAGE';
  static const String AUTHEN_PASSWORD = 'LOGIN_MODEL_BHHK';
}

class ImageAssets {
  static const String splash_screen = '${Base.imagePath}/splash_screen.png';
  static const String image_background =
      '${Base.imagePath}/image_background.png';
}

class SvgAssets {
  static const String ic_splash_next = '${Base.svgPath}/ic_splash_next.svg';
}
