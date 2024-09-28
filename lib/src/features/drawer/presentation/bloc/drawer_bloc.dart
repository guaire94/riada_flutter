import 'package:template_flutter_app/src/features/user/datasource/exceptions/user_not_logged_exception.dart';
import 'package:template_flutter_app/src/features/user/entity/user.dart';
import 'package:template_flutter_app/src/features/user/event_bus/user_log_state_updated_event.dart';
import 'package:template_flutter_app/src/features/user/repository/user_repository.dart';
import 'package:template_flutter_app/src/utils/app_event_bus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'drawer_event.dart';
part 'drawer_state.dart';

@injectable
class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  // MARK: Dependency
  final UserRepository _userRepository;
  final List _streams = [];

  // MARk: LifeCycle
  DrawerBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(LoadingState()) {
    on<LoadEvent>(_onLoad);
    on<LogoutEvent>(_onLogout);

    // MARK: - Events
    _streams.add(AppEventBus.instance
        .on<UserLogStateUpdatedEvent>()
        .listen((event) async {
      add(LoadEvent());
    }));
  }

  // MARK: - Privates
  Future _onLoad(
    LoadEvent event,
    Emitter<DrawerState> emit,
  ) async {
    try {
      final user = await _userRepository.getCurrentUser();

      emit(IdleState(
        currentUser: user,
      ));
    } on UserNotLoggedException catch (_) {
      emit(IdleState());
    } catch (_) {
      await _userRepository.signOut();
      emit(IdleState());
    }
  }

  Future _onLogout(
    LogoutEvent event,
    Emitter<DrawerState> emit,
  ) async {
    emit(LoadingState());
    await _userRepository.signOut();
    AppEventBus.instance.fire(UserLogStateUpdatedEvent());
    emit(LoginSuccessState());
  }

  @override
  Future<void> close() {
    _streams.forEach((stream) => stream.cancel());
    return super.close();
  }
}
