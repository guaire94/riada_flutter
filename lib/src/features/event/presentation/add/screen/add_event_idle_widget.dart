import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:riada/gen/assets.gen.dart';
import 'package:riada/src/design_system/datePicker/ds_date_picker_controller.dart';
import 'package:riada/src/design_system/datePicker/ds_date_picker_field.dart';
import 'package:riada/src/design_system/datePicker/ds_time_picker_controller.dart';
import 'package:riada/src/design_system/datePicker/ds_time_picker_field.dart';
import 'package:riada/src/design_system/ds_boolean_field.dart';
import 'package:riada/src/design_system/ds_text_field.dart';
import 'package:riada/src/design_system/v2/component/buttons/ds_button_elevated_v2.dart';
import 'package:riada/src/design_system/v2/component/image/ds_image_type_v2.dart';
import 'package:riada/src/design_system/v2/component/image/ds_image_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_border_radius_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/features/common/entity/google_place/place.dart';
import 'package:riada/src/features/common/presentation/common/addresses_autocomplete_field/addresses_autocomplete_field_factory.dart';
import 'package:riada/src/features/common/presentation/common/sport_selector/sport_cover_selector.dart';
import 'package:riada/src/features/common/presentation/common/sport_selector/sport_selector_widget.dart';
import 'package:riada/src/features/event/entity/sport.dart';
import 'package:riada/src/features/event/presentation/add/bloc/add_event_bloc.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:riada/src/utils/timestamp_extension.dart';

class AddEventIdleWidget extends StatefulWidget {
  // MARK: - Properties
  final IdleState _state;
  final void Function(Sport) _onSportChange;
  final void Function(String) _onSportCoverChange;

  AddEventIdleWidget({
    Key? key,
    required IdleState state,
    required void Function(Sport) onSportChange,
    required void Function(String) onSportCoverChange,
  })  : _state = state,
        _onSportChange = onSportChange,
        _onSportCoverChange = onSportCoverChange,
        super(key: key);

  @override
  State<AddEventIdleWidget> createState() => _AddEventIdleWidgetState();
}

class _AddEventIdleWidgetState extends State<AddEventIdleWidget> {
  // MARK: - Constant
  static final double _contentHeight = 760;
  static final double _sportSelectorHeight = 40;

  // MARK: - Properties
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _placeController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _priceController = TextEditingController();

  final DSDatePickerController _datePickerController = DSDatePickerController();

  final DSTimePickerController _timePickerController = DSTimePickerController();

  bool isPrivate = false;
  bool organizerIsParticipating = true;

  Place? _place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IgnorePointer(
        ignoring: widget._state.shouldRemoveGestures,
        child: Container(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Container(
              height: DSImageTypeV2.xl.height + _contentHeight,
              child: Stack(
                children: [
                  _coverBackground(),
                  _actionsSection(),
                  _backButton(context),
                  _mainContent(),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DSButtonElevatedV2(
        text: context.l10N.add_event,
        isLoading: widget._state.onConfirmLoading,
        onPressed: () {
          _onPressSubmit(context: context);
        },
      ),
    );
  }

  // MARK: - Private
  Widget _coverBackground() {
    return Positioned(
      child: GestureDetector(
        onTap: () {
          SportCoverSelector.showSportCoverSelectionBottomSheet(
              context: context,
              selectedSport: widget._state.selectedSport,
              onCoverChange: widget._onSportCoverChange);
        },
        child: Container(
          height: DSImageTypeV2.xl.height,
          width: DSImageTypeV2.xl.width,
          child: DSImageV2(
            type: DSImageTypeV2.xl,
            url: widget._state.selectedCover,
          ),
        ),
      ),
    );
  }

  Widget _actionsSection() {
    return Positioned(
      left: DSSpacingV2.s,
      right: DSSpacingV2.s,
      top: DSImageTypeV2.xl.height - (_sportSelectorHeight + DSSpacingV2.l),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SportSelectorWidget(
            selectedSport: widget._state.selectedSport,
            sports: widget._state.sports,
            onSportChange: widget._onSportChange,
          ),
          if (widget._state.selectedSport.covers.length > 1)
            GestureDetector(
              onTap: () {
                SportCoverSelector.showSportCoverSelectionBottomSheet(
                    context: context,
                    selectedSport: widget._state.selectedSport,
                    onCoverChange: widget._onSportCoverChange);
              },
              child: Assets.icons.addPhoto.image(),
            ),
        ],
      ),
    );
  }

  Widget _mainContent() {
    return Positioned(
      top: DSImageTypeV2.xl.height - DSSpacingV2.s,
      right: 0.0,
      left: 0.0,
      height: DSSpacingV2.m + _contentHeight,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DSBorderRadiusV2.normal),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: DSSpacingV2.s),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: DSSpacingV2.l),
              DSTextField(
                controller: _titleController,
                label: context.l10N.title,
                validate:
                    ValidationBuilder().minLength(3).maxLength(30).build(),
              ),
              SizedBox(height: DSSpacingV2.s),
              DSTextField(
                controller: _descriptionController,
                label: context.l10N.description,
                type: DSTextFieldType.multiline,
                maxLines: 4,
                validate: ValidationBuilder().minLength(10).build(),
              ),
              SizedBox(height: DSSpacingV2.l),
              Row(
                children: [
                  Expanded(
                    child: DSDatePickerTextField(
                      label: context.l10N.date,
                      firstDate: tomorrow,
                      lastDate: nextYear,
                      initialDate: tomorrow,
                      controller: _datePickerController,
                      validate: ValidationBuilder().minLength(1).build(),
                    ),
                  ),
                  SizedBox(width: DSSpacingV2.s),
                  Expanded(
                    child: DSTimePickerTextField(
                      label: context.l10N.hour,
                      controller: _timePickerController,
                      validate: ValidationBuilder().minLength(1).build(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: DSSpacingV2.l),
              initAddressesAutocompleteField(
                label: context.l10N.place,
                controller: _placeController,
                onSelectionChanged: (place) {
                  _place = place;
                },
              ),
              SizedBox(height: DSSpacingV2.l),
              DSTextField(
                type: DSTextFieldType.number,
                controller: _priceController,
                label: context.l10N.price,
                validate: ValidationBuilder().minLength(1).build(),
              ),
              SizedBox(height: DSSpacingV2.l),
              DSBooleanField(
                label: context.l10N.is_private,
                value: isPrivate,
                onChanged: (value) {
                  if (value != null)
                    setState(() {
                      isPrivate = value;
                    });
                },
              ),
              SizedBox(height: DSSpacingV2.l),
              DSBooleanField(
                label: context.l10N.organizer_is_participating,
                value: organizerIsParticipating,
                onChanged: (value) {
                  if (value != null)
                    setState(() {
                      organizerIsParticipating = value;
                    });
                },
              ),
              SizedBox(height: DSSpacingV2.l),
            ],
          ),
        ),
      ),
    );
  }

  Widget _backButton(BuildContext context) {
    return Positioned(
      left: DSSpacingV2.s,
      top: DSSpacingV2.xxxl,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Assets.icons.back.image(),
      ),
    );
  }

  Future _onPressSubmit({required BuildContext context}) async {
    if (_formKey.currentState?.validate() == true && _place != null) {
      // widget._bloc.add(
      //   SubmitEvent(
      //     _titleController.text,
      //     _place!,
      //     _datePickerController.date!,
      //     _timePickerController.time!,
      //     _descriptionController.text,
      //     eventType.type,
      //   ),
      // );
    }
  }
}
