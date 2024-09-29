import 'package:auto_route/auto_route.dart';
import 'package:riada/src/design_system/appBar/ds_app_bar.dart';
import 'package:riada/src/design_system/buttons/ds_button_elevated.dart';
import 'package:riada/src/design_system/ds_spacing.dart';
import 'package:riada/src/design_system/ds_text_field.dart';
import 'package:riada/src/factory/di.dart';
import 'package:riada/src/features/common/presentation/base/base_state.dart';
import 'package:riada/src/features/user/presentation/forget_password/bloc/forget_password_bloc.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';

@RoutePage()
class ForgetPasswordScreen extends StatefulWidget implements AutoRouteWrapper {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();

  @override
  Widget wrappedRoute(context) {
    return BlocProvider(
      create: (context) => getIt<ForgetPasswordBloc>(),
      child: this,
    );
  }
}

class _ForgetPasswordScreenState
    extends BaseState<ForgetPasswordScreen, ForgetPasswordBloc> {
  // MARK: - Properties
  final _formKey = GlobalKey<FormState>();
  final TextEditingController textEmailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc.add(LoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
      buildWhen: _buildWhen,
      listenWhen: _listenWhen,
      builder: _onStateChangeBuilder,
      listener: _onStateChangeListener(),
    );
  }

  bool _buildWhen(ForgetPasswordState previous, ForgetPasswordState current) {
    return current is LoadingState || current is IdleState;
  }

  bool _listenWhen(ForgetPasswordState previous, ForgetPasswordState current) {
    return current is SuccessState || current is ErrorState;
  }

  Function(BuildContext, ForgetPasswordState) _onStateChangeListener() {
    return (context, state) {
      if (state is SuccessState) {
        context.router.popForced();
      } else if (state is ErrorState) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(context.l10N.forget_password_error_title),
              content: Text(context.l10N.forget_password_error_message),
              actions: <Widget>[
                TextButton(
                  child: Text(context.l10N.ok),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    };
  }

  Widget _onStateChangeBuilder(
    BuildContext context,
    ForgetPasswordState state,
  ) {
    switch (state.runtimeType) {
      case IdleState:
        return _idleStateWidget(state: state as IdleState);
      case LoadingState:
        return _loadingWidget();
    }
    return Container();
  }

  Widget _loadingWidget() {
    return Center(
      child: CircularProgressIndicator(
        color: context.colorScheme.secondary,
      ),
    );
  }

  Future<void> _onPressSignup({
    required String email,
  }) async {
    if (_formKey.currentState?.validate() == true) {
      bloc.add(
        ResetPasswordEvent(
          email: email,
        ),
      );
    }
  }

  Widget _idleStateWidget({required IdleState state}) {
    return Scaffold(
      appBar: DSAppBar(title: context.l10N.forget_password_title),
      body: IgnorePointer(
        ignoring: state.showLoading,
        child: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(DSSpacing.sizeS),
                child: Column(
                  children: [
                    _formWidget(state: state),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _formWidget({required IdleState state}) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            context.l10N.forget_password_information_message,
            style: context.textTheme.headlineMedium,
            maxLines: null,
          ),
          SizedBox(height: DSSpacing.sizeL),
          DSTextField(
            controller: textEmailController,
            label: context.l10N.forget_password_form_email,
            validate: ValidationBuilder().email().build(),
          ),
          SizedBox(height: DSSpacing.sizeL),
          DSButtonElevated(
            text: context.l10N.forget_password_form_validation_button,
            isLoading: state.showLoading,
            onPressed: () => _onPressSignup(
              email: textEmailController.text,
            ),
          ),
        ],
      ),
    );
  }
}
