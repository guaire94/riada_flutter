import 'package:injectable/injectable.dart';
import 'package:riada/src/utils/city.dart';

@injectable
class GetCitiesUseCase {
  //MARK: - Public
  List<City> call() {
    return City.values;
  }
}
