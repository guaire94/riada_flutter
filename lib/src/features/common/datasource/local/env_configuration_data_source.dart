import 'package:injectable/injectable.dart';

enum EnvConfiguration { staging, prod }

@injectable
class EnvConfigurationDataSource {
  final EnvConfiguration _configuration;

  EnvConfigurationDataSource({required EnvConfiguration configuration})
      : _configuration = configuration;

  EnvConfiguration get configuration => _configuration;
}

extension FirebaseRootPathExtension on EnvConfigurationDataSource {
  String get firebaseRootPath {
    switch (_configuration) {
      case EnvConfiguration.staging:
        return 'Staging';
      case EnvConfiguration.prod:
        return 'Release';
    }
  }
}

extension APIKeysExtensions on EnvConfigurationDataSource {
  String get googleMapsApiKey {
    switch (_configuration) {
      case EnvConfiguration.staging:
        return 'AIzaSyDTIlQBgK72dpao2XPISx1U60psDeshcGc';
      case EnvConfiguration.prod:
        return 'AIzaSyDTIlQBgK72dpao2XPISx1U60psDeshcGc';
    }
  }

  bool get googlePayTestEnv {
    switch (_configuration) {
      case EnvConfiguration.staging:
        return true;
      case EnvConfiguration.prod:
        return false;
    }
  }
}
