enum ResponseEnum { request, response, error }

enum EnvEnum {
  dev,
  uat,
  prod,
}

extension EnvEnumExtension on EnvEnum {
  String get value {
    switch (this) {
      case EnvEnum.dev:
        return 'dev';
      case EnvEnum.uat:
        return 'uat';
      case EnvEnum.prod:
        return 'prod';
      default:
        throw Exception('Unknown environment');
    }
  }
}