import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:riada/src/design_system/ds_image_picker_controller.dart';
import 'package:riada/src/design_system/ds_text_field.dart';
import 'package:riada/src/design_system/v2/component/appBar/ds_app_bar_v2.dart';
import 'package:riada/src/design_system/v2/component/buttons/ds_button_elevated_v2.dart';
import 'package:riada/src/design_system/v2/component/image/ds_image_picker_v2.dart';
import 'package:riada/src/design_system/v2/component/image/ds_image_type_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/features/user/presentation/additional_profile_information/bloc/additional_profile_information_bloc.dart';
import 'package:riada/src/utils/build_context_extension.dart';

class AdditionalProfileInformationIdleWidget extends StatefulWidget {
  // MARK: - Dependencies
  final IdleState state;
  final AdditionalProfileInformationBloc bloc;

  AdditionalProfileInformationIdleWidget({
    super.key,
    required this.state,
    required this.bloc,
  });

  @override
  State<AdditionalProfileInformationIdleWidget> createState() {
    return _AdditionalProfileInformationIdleWidgetState();
  }
}

class _AdditionalProfileInformationIdleWidgetState
    extends State<AdditionalProfileInformationIdleWidget> {
  // MARK: - Properties
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final DSImagePickerController _profileImageController =
      DSImagePickerController();

  @override
  void initState() {
    super.initState();
  }

  // MARK: - Life cycle
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DSAppBarV2(
        title: context.l10N.additional_profile_information_title,
        canGoBack: false,
      ),
      body: PopScope(
        canPop: false,
        child: SafeArea(
          child: IgnorePointer(
            ignoring: widget.state.shouldRemoveGestures(),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(DSSpacingV2.s),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: DSSpacingV2.s),
                          Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DSImagePickerV2(
                                  type: DSImageTypeV2.avatar,
                                  controller: _profileImageController,
                                ),
                                SizedBox(
                                  height: DSSpacingV2.xxs,
                                ),
                                Text(
                                  context.l10N
                                      .additional_profile_information_label_profile,
                                  style: context.textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: DSSpacingV2.s,
                          ),
                          DSTextField(
                            controller: _userNameController,
                            label: context.l10N.full_name,
                            validate: ValidationBuilder()
                                .minLength(3)
                                .maxLength(30)
                                .build(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DSButtonElevatedV2(
        text: context.l10N.save,
        isLoading: widget.state.onSubmitLoading,
        onPressed: _onPressSubmit,
      ),
    );
  }

  // MARK: - Private

  Future<void> _onPressSubmit() async {
    if (_formKey.currentState?.validate() == true) {
      widget.bloc.add(
        UpdateEvent(
          username: _userNameController.text,
          imageProfile: _profileImageController.image,
          email: _emailController.text,
          phoneNumber: _phoneController.text,
        ),
      );
    }
  }
}
