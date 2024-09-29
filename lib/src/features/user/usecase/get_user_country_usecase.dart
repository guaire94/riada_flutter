import 'package:riada/src/features/user/repository/user_repository.dart';
import 'package:riada/src/utils/constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserCountryUseCase {
  final UserRepository _userRepository;

  // MARk: LifeCycle
  GetUserCountryUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  //MARK: - Public
  Future<String> call() async {
    String country;
    try {
      final user = await _userRepository.getCurrentUser();
      country = user.country;
    } catch (_) {
      country = TemplateConstants.country;
    }
    return country;
  }
}
