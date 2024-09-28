import 'package:injectable/injectable.dart';

enum EnvConfiguration { staging, prod }

@injectable
class EnvConfigurationDataSource {
  final EnvConfiguration _configuration;

  EnvConfigurationDataSource({required EnvConfiguration configuration})
      : _configuration = configuration;

  EnvConfiguration get configuration => _configuration;
}

extension APIKeysExtensions on EnvConfigurationDataSource {
  String get googleMapsApiKey {
    switch (_configuration) {
      case EnvConfiguration.staging:
        return 'GMAPS_STAGING';
      case EnvConfiguration.prod:
        return 'GMAPS_PROD';
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
