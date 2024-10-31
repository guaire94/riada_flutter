import 'package:injectable/injectable.dart';
import 'package:riada/src/utils/city.dart';

@injectable
class GetCitiesUseCase {
  //MARK: - Public
  Future<List<City>> call() async {
    return City.values;
  }
}
