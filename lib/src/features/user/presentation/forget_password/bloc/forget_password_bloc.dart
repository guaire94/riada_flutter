import 'package:template_flutter_app/src/features/user/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

@injectable
class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final AuthRepository _authRepository;

  ForgetPasswordBloc({
    required AuthRepository authRepository,
  })  : this._authRepository = authRepository,
        super(LoadingState()) {
    on<LoadEvent>(_onLoad);
    on<ResetPasswordEvent>(_onReset);
  }

  Future<void> _onLoad(
    LoadEvent event,
    Emitter<ForgetPasswordState> emit,
  ) async {
    emit(IdleState());
  }

  Future<void> _onReset(
    ResetPasswordEvent event,
    Emitter<ForgetPasswordState> emit,
  ) async {
    emit(IdleState(showLoading: true));
    try {
      await _authRepository.sendForgetPasswordEmail(email: event.email);
      emit(SuccessState());
    } catch (_) {
      emit(ErrorState());
    }
    emit(IdleState());
  }
}
