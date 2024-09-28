import 'dart:convert';
import 'dart:ui';

import 'package:template_flutter_app/src/features/common/datasource/exceptions/no_data_available_exception.dart';
import 'package:template_flutter_app/src/features/common/datasource/local/env_configuration_data_source.dart';
import 'package:template_flutter_app/src/features/common/entity/google_place/place.dart';
import 'package:template_flutter_app/src/features/common/entity/google_place/suggestion.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@injectable
class GooglePlaceDataSource {
  // MARK: - Dependencies
  final EnvConfigurationDataSource _configurationDataSource;
  final Client _client;

  final String _suggestionBaseUrl =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json';
  final String _detailsBaseUrl =
      'https://maps.googleapis.com/maps/api/place/details/json';

  // MARK: - Life cycle
  GooglePlaceDataSource({
    required EnvConfigurationDataSource configurationDataSource,
  })  : _configurationDataSource = configurationDataSource,
        _client = Client();

  Future<List<Suggestion>> fetchAddresses(String input) async {
    Locale currentLocale = window.locale;

    final apiKey = _configurationDataSource.googleMapsApiKey;
    final request =
        '$_suggestionBaseUrl?input=$input&language=${currentLocale.languageCode}&key=$apiKey';
    final response = await _client.get(Uri.parse(request));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return Suggestion.fromJson(json: result);
    } else {
      throw NoDataAvailableException();
    }
  }

  Future<List<Suggestion>> fetchCities(String input) async {
    Locale currentLocale = window.locale;

    final apiKey = _configurationDataSource.googleMapsApiKey;
    final request =
        '$_suggestionBaseUrl?input=$input&types=(cities)&language=${currentLocale.languageCode}&key=$apiKey';
    final response = await _client.get(Uri.parse(request));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return Suggestion.fromJson(json: result);
    } else {
      throw NoDataAvailableException();
    }
  }

  Future<Place> getPlaceDetailFromId(String placeId) async {
    final apiKey = _configurationDataSource.googleMapsApiKey;
    final request =
        '$_detailsBaseUrl?place_id=$placeId&fields=address_component%2Cgeometry%2Cformatted_address&key=$apiKey';
    final response = await _client.get(Uri.parse(request));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return Place.fromJson(result);
    } else {
      throw NoDataAvailableException();
    }
  }
}
