import 'package:riada/src/factory/di.dart';
import 'package:riada/src/features/common/entity/google_place/place.dart';
import 'package:riada/src/features/common/presentation/common/cities_autocomplete_field/cities_autocomplete_field.dart';
import 'package:riada/src/features/common/repository/google_place_repository.dart';
import 'package:flutter/material.dart';

CitiesAutocompleteField initCitiesAutocompleteField({
  required String label,
  required TextEditingController controller,
  required Function(Place) onSelectionChanged,
}) {
  return CitiesAutocompleteField(
    label: label,
    controller: controller,
    googlePlaceRepository: getIt<GooglePlaceRepository>(),
    onSelectionChanged: (place) {
      onSelectionChanged(place);
      FocusManager.instance.primaryFocus?.unfocus();
    },
  );
}
