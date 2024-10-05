import 'package:injectable/injectable.dart';
import 'package:riada/src/features/user/repository/user_repository.dart';
import 'package:riada/src/utils/city.dart';

@injectable
class GetCitiesUseCase {
  final UserRepository _userRepository;

  // MARk: LifeCycle
  GetCitiesUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  //MARK: - Public
  Future<List<City>> call() async {
    return City.values;
  }
}
