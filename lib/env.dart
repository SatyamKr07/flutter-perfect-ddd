enum EnvironmentEnum { dev, uat, prod }

class Env {
  static late EnvironmentEnum _env;

  static void setEnvironment(EnvironmentEnum env) {
    _env = env;
  }

  static EnvironmentEnum get getEnv {
    switch (_env) {
      case EnvironmentEnum.dev:
        return EnvironmentEnum.dev;
      case EnvironmentEnum.uat:
        return EnvironmentEnum.uat;
      case EnvironmentEnum.prod:
        return EnvironmentEnum.prod;
    }
  }

  static String get baseUrl {
    switch (_env) {
      case EnvironmentEnum.dev:
        return 'https://api.jikan.moe/v4';
      case EnvironmentEnum.uat:
        return 'https://uat-api.example.com';
      case EnvironmentEnum.prod:
        return 'https://api.example.com';
    }
  }
}
