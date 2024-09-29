import 'package:auto_route/auto_route.dart';
import 'package:riada/src/factory/di.dart';
import 'package:riada/src/features/common/presentation/base/base_state.dart';
import 'package:riada/src/features/common/presentation/common/loading_widget.dart';
import 'package:riada/src/features/user/presentation/sign_up/bloc/sign_up_bloc.dart';
import 'package:riada/src/features/user/presentation/sign_up/screen/sign_up_idle_widget.dart';
import 'package:riada/src/features/user/presentation/sign_up/screen/verify_phone_number_bottom_sheet_widget.dart';
import 'package:riada/src/router/routes.gr.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget implements AutoRouteWrapper {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();

  @override
  Widget wrappedRoute(context) {
    return BlocProvider(
      create: (context) => getIt<SignUpBloc>(),
      child: this,
    );
  }
}

class _SignUpScreenState extends BaseState<SignUpScreen, SignUpBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(LoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      buildWhen: _buildWhen,
      listenWhen: _listenWhen,
      builder: _onStateChangeBuilder,
      listener: _onStateChangeListener(),
    );
  }

  bool _buildWhen(SignUpState previous, SignUpState current) {
    return current is LoadingState || current is IdleState;
  }

  bool _listenWhen(SignUpState previous, SignUpState current) {
    return current is VerificationState ||
        current is InvalidPhoneNumberState ||
        current is InvalidSmsCodeState ||
        current is ErrorState ||
        current is SuccessState ||
        current is InactiveState;
  }

  Function(BuildContext, SignUpState) _onStateChangeListener() {
    return (context, state) async {
      if (state is VerificationState) {
        VerifyPhoneNumberBottomSheetWidget.show(context, _verifySmsCode);
      } else if (state is InvalidPhoneNumberState) {
        _showSignInError(
          context,
          context.l10N.phone_number_verification_invalid_phone_number_title,
          context.l10N.phone_number_verification_invalid_phone_number_message,
        );
      } else if (state is InvalidSmsCodeState) {
        _showSignInError(
          context,
          context.l10N.phone_number_verification_invalid_code_title,
          context.l10N.phone_number_verification_invalid_code_message,
        );
      } else if (state is SuccessState) {
        if (state.shouldFinaliseSignUp) {
          await context.replaceRoute(AdditionalProfileInformationRoute());
        } else {
          context.router.popForced();
        }
      } else if (state is ErrorState) {
        _showSignInError(
          context,
          context.l10N.common_error_title,
          context.l10N.common_error_message,
        );
      } else if (state is InactiveState) {
        _showSignInError(
          context,
          context.l10N.inactive_account_title,
          context.l10N.inactive_account_message,
        );
      }
    };
  }

  Widget _onStateChangeBuilder(
    BuildContext context,
    SignUpState state,
  ) {
    if (state is LoadingState) {
      return Scaffold(
        body: LoadingWidget(),
      );
    } else if (state is IdleState) {
      return SignUpIdleWidget(
        state: state,
        onPressVerifyPhoneNumber: _onPressVerifyPhoneNumber,
        onPressGoogleSignIn: _onPressGoogleSignIn,
        onPressAppleSignIn: _onPressAppleSignIn,
      );
    }

    return Container();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  void _onPressVerifyPhoneNumber(String phoneNumber) {
    bloc.add(
      VerifyPhoneNumberEvent(phoneNumber: phoneNumber),
    );
  }

  void _onPressGoogleSignIn() {
    bloc.add(SignWithGoogleEvent());
  }

  void _onPressAppleSignIn() {
    bloc.add(SignWithAppleEvent());
  }

  void _showSignInError(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text(context.l10N.ok),
              onPressed: () {
                context.router.popForced();
              },
            ),
          ],
        );
      },
    );
  }

  void _verifySmsCode(String smsCode) {
    bloc.add(VerifySmsCodeEvent(smsCode: smsCode));
  }
}
