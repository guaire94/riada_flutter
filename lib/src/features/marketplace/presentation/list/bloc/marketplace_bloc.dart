import 'package:template_flutter_app/src/features/user/entity/user.dart';
import 'package:template_flutter_app/src/features/user/event_bus/user_log_state_updated_event.dart';
import 'package:template_flutter_app/src/features/user/repository/user_repository.dart';
import 'package:template_flutter_app/src/utils/app_event_bus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'marketplace_event.dart';
part 'marketplace_state.dart';

@injectable
class MarketplaceBloc extends Bloc<MarketplaceEvent, MarketplaceState> {
  // MARK: Properties
  final List _streams = [];

  // MARK: Dependency
  final UserRepository _userRepository;

  // MARk: LifeCycle
  MarketplaceBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(LoadingState()) {
    on<LoadEvent>((event, emit) async {
      try {
        final user = await _userRepository.getCurrentUser();

        emit(IdleState(
          currentUser: user,
        ));
      } catch (_) {
        emit(IdleState());
      }
    });

    _streams.add(AppEventBus.instance
        .on<UserLogStateUpdatedEvent>()
        .listen((event) async {
      add(LoadEvent());
    }));
  }

  @override
  Future<void> close() {
    _streams.forEach((stream) => stream.cancel());
    return super.close();
  }
}
