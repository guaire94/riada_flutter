import 'package:template_flutter_app/src/features/user/entity/user.dart';
import 'package:template_flutter_app/src/features/user/event_bus/user_log_state_updated_event.dart';

import 'package:template_flutter_app/src/features/user/repository/user_repository.dart';
import 'package:template_flutter_app/src/utils/app_event_bus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'my_profile_event.dart';
part 'my_profile_state.dart';

@injectable
class MyProfileBloc extends Bloc<MyProfileEvent, MyProfileState> {
  // MARK: Properties
  final List _streams = [];

  // MARK: Dependencies
  final UserRepository _userRepository;

  // MARK: - LifeCycle
  MyProfileBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(
          LoadingState(),
        ) {
    on<LoadEvent>(_onLoad);
    on<ReloadEvent>(_onReload);
    on<LogoutEvent>(_onLogout);

    // MARK: - Events
    _streams.add(AppEventBus.instance.on<UserLogStateUpdatedEvent>().listen(
          (event) => add(LoadEvent()),
        ));
  }

  // MARK: - Privates
  Future _onLoad(
    LoadEvent event,
    Emitter<MyProfileState> emit,
  ) async {
    try {
      final user = await _userRepository.getCurrentUser();

      emit(
        IdleState(
          user: user,
        ),
      );
    } catch (e) {
      emit(ErrorState());
    }
  }

  Future _onReload(
    ReloadEvent event,
    Emitter<MyProfileState> emit,
  ) async {
    emit(LoadingState());
    add(LoadEvent());
  }

  Future _onLogout(
    LogoutEvent event,
    Emitter<MyProfileState> emit,
  ) async {
    emit(LoadingState());
    await _userRepository.signOut();
    emit(LogoutState());
  }

  @override
  Future<void> close() {
    _streams.forEach((stream) => stream.cancel());
    return super.close();
  }
}
