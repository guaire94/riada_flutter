import 'dart:math';

import 'package:riada/src/design_system/ds_spacing.dart';
import 'package:riada/src/design_system/ds_text_field.dart';
import 'package:riada/src/features/common/entity/google_place/place.dart';
import 'package:riada/src/features/common/entity/google_place/suggestion.dart';
import 'package:riada/src/features/common/repository/google_place_repository.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

/*
TODO: Bloc is not used here because the _optionsBuilder function of
 the AutoComplete component required an async method to update the list of
 suggestions.
 The mechanism of event/state will either:
  - redraw the view so it will lost the focus and the suggestions list will not
   be visible
  - update only the items (which is what we want) but i didn't found a way to force
  the display of the list and keeping the focus in the text field
*/
class CitiesAutocompleteField extends StatelessWidget {
  // MARK: - Constants
  final double _optionsElevation = 4.0;
  final double _optionsMaxHeight = 200;
  final double _optionsItemHeight = 50;

  // MARK: - Dependencies
  final String _label;
  final GooglePlaceRepository _googlePlaceRepository;
  final TextEditingController _controller;
  final Function(Place) _onSelectionChanged;

  // MARK: - Properties
  final FocusNode _focusNode = FocusNode();

  // MARK: - Life cycle
  CitiesAutocompleteField({
    Key? key,
    required String label,
    required GooglePlaceRepository googlePlaceRepository,
    required TextEditingController controller,
    required Function(Place) onSelectionChanged,
  })  : _label = label,
        _googlePlaceRepository = googlePlaceRepository,
        _onSelectionChanged = onSelectionChanged,
        _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<Suggestion>(
      textEditingController: _controller,
      focusNode: _focusNode,
      displayStringForOption: (Suggestion option) => option.description,
      optionsBuilder: _optionsBuilder,
      fieldViewBuilder: _fieldViewBuilder,
      optionsViewBuilder: _optionsViewBuilder,
      onSelected: _onSelected,
    );
  }

  // MARK: - Private
  void _onSelected(Suggestion suggestion) async {
    final place = await _googlePlaceRepository.getPlaceDetailFromId(suggestion);
    _onSelectionChanged(place);
  }

  Future<Iterable<Suggestion>> _optionsBuilder(
    TextEditingValue textEditingValue,
  ) async {
    if (textEditingValue.text.isEmpty) {
      return const Iterable.empty();
    }

    return await _googlePlaceRepository.fetchCities(
      textEditingValue.text,
    );
  }

  Widget _fieldViewBuilder(
    BuildContext context,
    TextEditingController textEditingController,
    FocusNode focusNode,
    VoidCallback onFieldSubmitted,
  ) {
    return DSTextField(
      label: _label,
      controller: textEditingController,
      focusNode: focusNode,
      validate: ValidationBuilder().minLength(3).build(),
      showCursor: false,
    );
  }

  Widget _optionsViewBuilder(
      BuildContext context,
      AutocompleteOnSelected<Suggestion> onSelected,
      Iterable<Suggestion> options) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        elevation: _optionsElevation,
        child: SizedBox(
          height: min(_optionsMaxHeight, options.length * _optionsItemHeight),
          child: ListView.builder(
            padding: const EdgeInsets.all(DSSpacing.sizeXxs),
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) {
              final Suggestion option = options.elementAt(index);
              return GestureDetector(
                onTap: () {
                  onSelected(option);
                },
                child: ListTile(
                  title: Text(
                    option.description,
                    style: context.textTheme.bodyLarge,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
