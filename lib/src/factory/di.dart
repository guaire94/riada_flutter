import 'package:riada/src/features/common/datasource/local/env_configuration_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies({required EnvConfiguration env}) {
  getIt.registerFactory<EnvConfiguration>(() => env);
  getIt.init();
}
