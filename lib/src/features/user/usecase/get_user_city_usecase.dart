import 'package:template_flutter_app/src/features/user/repository/user_repository.dart';
import 'package:template_flutter_app/src/utils/constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserCityUseCase {
  final UserRepository _userRepository;

  // MARk: LifeCycle
  GetUserCityUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  //MARK: - Public
  Future<String> call() async {
    String city;
    try {
      final user = await _userRepository.getCurrentUser();
      city = user.city;
    } catch (_) {
      city = TemplateConstants.city;
    }
    return city;
  }
}
