import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:riada/src/features/user/datasource/exceptions/invalid_sms_code_exception.dart';
import 'package:riada/src/features/user/entity/social_user.dart';
import 'package:riada/src/features/user/entity/user_status.dart';
import 'package:riada/src/features/user/event_bus/did_verify_phone_number_event.dart';
import 'package:riada/src/features/user/event_bus/user_log_state_updated_event.dart';
import 'package:riada/src/features/user/repository/auth_repository.dart';
import 'package:riada/src/features/user/repository/phone_number_verification_repository.dart';
import 'package:riada/src/features/user/repository/user_repository.dart';
import 'package:riada/src/utils/app_event_bus.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository _authRepository;
  final PhoneNumberVerificationRepository _phoneNumberVerificationRepository;
  final UserRepository _userRepository;
  final List _streams = [];

  SignUpBloc({
    required AuthRepository authRepository,
    required PhoneNumberVerificationRepository
        phoneNumberVerificationRepository,
    required UserRepository userRepository,
  })  : this._authRepository = authRepository,
        this._phoneNumberVerificationRepository =
            phoneNumberVerificationRepository,
        this._userRepository = userRepository,
        super(LoadingState()) {
    on<LoadEvent>(_onLoad);
    on<VerifyPhoneNumberEvent>(_onVerifyPhoneNumberEvent);
    on<VerifySmsCodeEvent>(_onVerifySmsCodeEvent);
    on<SignWithGoogleEvent>(_onGoogleSign);
    on<SignWithAppleEvent>(_onAppleSign);

    _streams.add(AppEventBus.instance
        .on<DidVerifyPhoneNumberEvent>()
        .listen((event) async {
      try {
        final shouldFinaliseSignUp = await _createSocialUserIfNeeded(
          user: event.user,
        );
        AppEventBus.instance.fire(UserLogStateUpdatedEvent());
        emit(SuccessState(shouldFinaliseSignUp: shouldFinaliseSignUp));
      } catch (e) {
        emit(IdleState());
        emit(ErrorState());
      }
    }));
  }

  void _onLoad(
    LoadEvent event,
    Emitter<SignUpState> emit,
  ) =>
      emit(IdleState());

  Future<void> _onGoogleSign(
    SignWithGoogleEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(IdleState(onGoogleSignInLoading: true));
    try {
      final user = await _authRepository.signInWithGoogle();
      final shouldFinaliseSignUp = await _createSocialUserIfNeeded(user: user);
      AppEventBus.instance.fire(UserLogStateUpdatedEvent());
      emit(SuccessState(shouldFinaliseSignUp: shouldFinaliseSignUp));
    } catch (e) {
      emit(IdleState());
      emit(ErrorState());
    }
  }

  Future<void> _onAppleSign(
    SignWithAppleEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(IdleState(onAppleSignInLoading: true));
    try {
      final user = await _authRepository.signInWithApple();
      final shouldFinaliseSignUp = await _createSocialUserIfNeeded(user: user);
      AppEventBus.instance.fire(UserLogStateUpdatedEvent());
      emit(SuccessState(shouldFinaliseSignUp: shouldFinaliseSignUp));
    } catch (e) {
      emit(IdleState());
      emit(ErrorState());
    }
  }

  Future<bool> _createSocialUserIfNeeded({
    required SocialUser user,
  }) async {
    try {
      final userReference = _userRepository.getUserReference(user.userId);
      final u = await _userRepository.getUserByReference(userReference);
      if (u.status == UserStatus.inactive) {
        await _authRepository.signOut();
        emit(IdleState());
        emit(InactiveState());
        return false;
      }
      return false;
    } catch (_) {
      await _userRepository.createUser(socialUser: user);
      return true;
    }
  }

  Future<void> _onVerifyPhoneNumberEvent(
    VerifyPhoneNumberEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(IdleState(onSubmitLoading: true));

    try {
      await _phoneNumberVerificationRepository
          .verifyPhoneNumber(event.phoneNumber);
      emit(VerificationState());
    } catch (_) {
      emit(IdleState());
      emit(ErrorState());
    }
  }

  Future<void> _onVerifySmsCodeEvent(
    VerifySmsCodeEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(IdleState(onSubmitLoading: true));
    try {
      await _phoneNumberVerificationRepository.verifySmsCode(event.smsCode);
    } on InvalidSmsCodeException catch (_) {
      emit(IdleState());
      emit(InvalidSmsCodeState());
    } catch (_) {
      emit(IdleState());
      emit(ErrorState());
    }
  }

  @override
  Future<void> close() {
    _streams.forEach((stream) => stream.cancel());
    return super.close();
  }
}
