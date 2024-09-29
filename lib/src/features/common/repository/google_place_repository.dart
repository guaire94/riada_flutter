import 'package:riada/src/features/common/datasource/google_place_data_source.dart';
import 'package:riada/src/features/common/entity/google_place/place.dart';
import 'package:riada/src/features/common/entity/google_place/suggestion.dart';
import 'package:injectable/injectable.dart';

@injectable
class GooglePlaceRepository {
  final GooglePlaceDataSource _dataSource;

  GooglePlaceRepository({required GooglePlaceDataSource dataSource})
      : _dataSource = dataSource;

  Future<List<Suggestion>> fetchCities(String input) async {
    return _dataSource.fetchCities(input);
  }

  Future<List<Suggestion>> fetchAddresses(String input) async {
    return _dataSource.fetchAddresses(input);
  }

  Future<Place> getPlaceDetailFromId(String placeId) async {
    return _dataSource.getPlaceDetailFromId(placeId);
  }
}
