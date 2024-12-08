import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:riada/src/features/common/repository/sport_repository.dart';
import 'package:riada/src/features/user/datasource/exceptions/user_not_logged_exception.dart';
import 'package:riada/src/features/user/entity/user.dart';
import 'package:riada/src/features/user/entity/user_status.dart';
import 'package:riada/src/features/user/event_bus/user_log_state_updated_event.dart';
import 'package:riada/src/features/user/repository/notifications_repository.dart';
import 'package:riada/src/features/user/repository/user_repository.dart';
import 'package:riada/src/utils/app_event_bus.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // MARK: Properties
  static const _launchStateDuration = Duration(seconds: 1);
  final List _streams = [];

  // MARK: Dependency
  final UserRepository _userRepository;
  final NotificationsRepository _notificationsRepository;
  final SportRepository _sportRepository;

  // MARk: LifeCycle
  HomeBloc({
    required UserRepository userRepository,
    required NotificationsRepository notificationsRepository,
    required SportRepository sportRepository,
  })  : _userRepository = userRepository,
        _notificationsRepository = notificationsRepository,
        _sportRepository = sportRepository,
        super(LaunchState()) {
    on<LoadEvent>((event, emit) async {
      await Future.delayed(_launchStateDuration);
      try {
        final User user = await _userRepository.getCurrentUser();
        await _sportRepository.fetchAllSports();

        await _notificationsRepository.requestPermission(
          onMessageTapped: (notification) {
            if (notification.deeplink != null) {
              add(RedirectEvent(deeplink: notification.deeplink!));
            }
          },
        );
        _userRepository.updateConnectionDate();
        _userRepository.updateNotificationToken();

        emit(IdleState());
        String? initialDeeplink =
            await _notificationsRepository.getInitialDeeplink();
        if (user.status == UserStatus.signed) {
          emit(FinaliseSignUpState());
          return;
        }
        if (initialDeeplink != null) {
          add(RedirectEvent(deeplink: initialDeeplink));
          return;
        }
      } on UserNotLoggedException catch (_) {
        emit(IdleState());
      } catch (e) {
        await _userRepository.signOut();
        emit(IdleState());
      }
    });

    on<ReloadEvent>((event, emit) async {
      try {
        await _notificationsRepository.requestPermission(
          onMessageTapped: (notification) {
            if (notification.deeplink != null) {
              add(RedirectEvent(deeplink: notification.deeplink!));
            }
          },
        );
        _userRepository.updateConnectionDate();
        _userRepository.updateNotificationToken();

        emit(IdleState());
      } on UserNotLoggedException catch (_) {
        emit(IdleState());
      } catch (e) {
        await _userRepository.signOut();
        emit(IdleState());
      }
    });

    _streams.add(AppEventBus.instance
        .on<UserLogStateUpdatedEvent>()
        .listen((event) async {
      add(ReloadEvent());
    }));

    on<RedirectEvent>((event, emit) async {
      emit(RedirectState(deeplink: event.deeplink));
    });
  }

  @override
  Future<void> close() {
    _streams.forEach((stream) => stream.cancel());
    return super.close();
  }
}
