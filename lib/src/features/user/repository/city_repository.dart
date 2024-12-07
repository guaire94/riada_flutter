import 'package:injectable/injectable.dart';
import 'package:riada/src/utils/city.dart';

@singleton
class CityRepository {
  List<City> cities = City.values;
  City selectedCity = City.values.first;
}
