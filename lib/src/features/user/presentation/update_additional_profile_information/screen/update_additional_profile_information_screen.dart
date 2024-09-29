import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:riada/src/design_system/ds_image_picker_controller.dart';
import 'package:riada/src/design_system/ds_text_field.dart';
import 'package:riada/src/design_system/v2/component/appBar/ds_app_bar_v2.dart';
import 'package:riada/src/design_system/v2/component/buttons/ds_button_elevated_v2.dart';
import 'package:riada/src/design_system/v2/component/buttons/ds_button_text_v2.dart';
import 'package:riada/src/design_system/v2/component/image/ds_image_picker_v2.dart';
import 'package:riada/src/design_system/v2/component/image/ds_image_type_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/factory/di.dart';
import 'package:riada/src/features/common/entity/google_place/place.dart';
import 'package:riada/src/features/common/presentation/base/base_state.dart';
import 'package:riada/src/features/common/presentation/common/cities_autocomplete_field/cities_autocomplete_field_factory.dart';
import 'package:riada/src/features/user/presentation/update_additional_profile_information/bloc/update_additional_profile_information_bloc.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class UpdateAdditionalProfileInformationScreen extends StatefulWidget
    implements AutoRouteWrapper {
  const UpdateAdditionalProfileInformationScreen({
    super.key,
  });

  @override
  State<UpdateAdditionalProfileInformationScreen> createState() =>
      _UpdateAdditionalProfileInformationScreenState();

  @override
  Widget wrappedRoute(context) {
    return BlocProvider(
      create: (context) => getIt<UpdateAdditionalProfileInformationBloc>(),
      child: this,
    );
  }
}

class _UpdateAdditionalProfileInformationScreenState extends BaseState<
    UpdateAdditionalProfileInformationScreen,
    UpdateAdditionalProfileInformationBloc> {
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _textEmailController = TextEditingController();
  final TextEditingController _textPhoneNumberController =
      TextEditingController();
  final DSImagePickerController _profileImageController =
      DSImagePickerController();

  Place? _city;

  @override
  void initState() {
    super.initState();
    bloc.add(LoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateAdditionalProfileInformationBloc,
        UpdateAdditionalProfileInformationState>(
      buildWhen: _buildWhen,
      listenWhen: _listenWhen,
      builder: _onStateChangeBuilder,
      listener: _onStateChangeListener(),
    );
  }

  bool _buildWhen(UpdateAdditionalProfileInformationState previous,
      UpdateAdditionalProfileInformationState current) {
    return current is LoadingState || current is IdleState;
  }

  bool _listenWhen(UpdateAdditionalProfileInformationState previous,
      UpdateAdditionalProfileInformationState current) {
    return current is SuccessState ||
        current is ErrorState ||
        current is DeleteSuccessState;
  }

  Function(BuildContext, UpdateAdditionalProfileInformationState)
      _onStateChangeListener() {
    return (context, state) {
      switch (state.runtimeType) {
        case SuccessState:
          context.router.popForced();
          break;
        case ErrorState:
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(context.l10N.common_error_title),
                content: Text(context.l10N.common_error_message),
                actions: <Widget>[
                  TextButton(
                      child: Text(context.l10N.ok),
                      onPressed: () => context.router.popForced()),
                ],
              );
            },
          );
          break;
        case DeleteSuccessState:
          context.router.popForced();
          context.router.popForced();
          break;
      }
    };
  }

  Widget _onStateChangeBuilder(
    BuildContext context,
    UpdateAdditionalProfileInformationState state,
  ) {
    switch (state.runtimeType) {
      case IdleState:
        return _idleState(state: state as IdleState);
      case LoadingState:
        return _loadingWidget();
    }
    return Container();
  }

  Widget _loadingWidget() {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(
          color: context.colorScheme.secondary,
        ),
      ),
    );
  }

  Widget _idleState({required IdleState state}) {
    _textEmailController.text = state.user.email.toString();
    _textPhoneNumberController.text = state.user.phone.toString();
    _profileImageController.imageUrl = state.user.avatar;
    _cityController.text = state.user.city + ", " + state.user.country;

    return Scaffold(
      appBar: DSAppBarV2(
        title: context.l10N.my_profile_informations,
      ),
      body: IgnorePointer(
        ignoring: state.shouldRemoveGestures(),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(DSSpacingV2.s),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          DSImagePickerV2(
                            type: DSImageTypeV2.avatar,
                            controller: _profileImageController,
                          ),
                          SizedBox(height: DSSpacingV2.s),
                          initCitiesAutocompleteField(
                            label: context.l10N.city,
                            controller: _cityController,
                            onSelectionChanged: (place) {
                              _city = place;
                            },
                          ),
                          SizedBox(height: DSSpacingV2.s),
                          DSTextField(
                            controller: _textEmailController,
                            label: context.l10N.email,
                            readOnly: true,
                          ),
                          SizedBox(height: DSSpacingV2.s),
                          DSTextField(
                            controller: _textPhoneNumberController,
                            label: context.l10N.phone,
                            readOnly: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: DSSpacingV2.l),
                  child: DSButtonElevatedV2(
                    text: context.l10N.save,
                    isLoading: state.onSubmitLoading,
                    onPressed: () => {
                      _onPressSubmit(
                        imageProfile: _profileImageController.image,
                      )
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 100,
        child: DSButtonTextV2(
          text: context.l10N.delete_account,
          onPressed: _onPressDelete,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEmailController.dispose();
    _textPhoneNumberController.dispose();
    super.dispose();
  }

  // MARK: - Actions
  Future<void> _onPressSubmit({
    required File? imageProfile,
  }) async {
    bloc.add(
      UpdateEvent(
        imageProfile: imageProfile,
        place: _city,
      ),
    );
  }

  Future<void> _onPressDelete() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.l10N.delete_account),
          content: Text(context.l10N.delete_account_message),
          actions: <Widget>[
            TextButton(
              child: Text(context.l10N.cancel),
              onPressed: () => context.router.popForced(),
            ),
            TextButton(
              child: Text(context.l10N.ok),
              onPressed: () => bloc.add(
                DeleteEvent(),
              ),
            ),
          ],
        );
      },
    );
  }
}
