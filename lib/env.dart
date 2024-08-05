
import '_core/my_enums/my_enums.dart';

class Env {
  static late EnumEnv _env;

  static void setEnvironment(EnumEnv env) {
    _env = env;
  }

  static EnumEnv get getEnv {
    switch (_env) {
      case EnumEnv.dev:
        return EnumEnv.dev;
      case EnumEnv.uat:
        return EnumEnv.uat;
      case EnumEnv.prod:
        return EnumEnv.prod;
    }
  }

  static String get baseUrl {
    switch (_env) {
      case EnumEnv.dev:
        return 'https://api.jikan.moe/v4';
      case EnumEnv.uat:
        return 'https://uat-api.example.com';
      case EnumEnv.prod:
        return 'https://api.example.com';
    }
  }
}
