import 'package:template_flutter_app/src/factory/di.dart';
import 'package:template_flutter_app/src/features/common/entity/google_place/place.dart';
import 'package:template_flutter_app/src/features/common/presentation/common/addresses_autocomplete_field/addresses_autocomplete_field.dart';
import 'package:template_flutter_app/src/features/common/repository/google_place_repository.dart';
import 'package:flutter/material.dart';

AddressesAutocompleteField initAddressesAutocompleteField({
  required String label,
  required TextEditingController controller,
  required Function(Place) onSelectionChanged,
}) {
  return AddressesAutocompleteField(
    label: label,
    controller: controller,
    googlePlaceRepository: getIt<GooglePlaceRepository>(),
    onSelectionChanged: (place) {
      onSelectionChanged(place);
      FocusManager.instance.primaryFocus?.unfocus();
    },
  );
}