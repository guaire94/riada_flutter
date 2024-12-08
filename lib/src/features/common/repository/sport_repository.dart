import 'package:riada/src/features/common/datasource/sport_data_source.dart';
import 'package:riada/src/features/event/entity/sport.dart';
import 'package:injectable/injectable.dart';

@singleton
class SportRepository {
  final SportDataSource _sportDataSource;
  final List<Sport> _sports = [];

  SportRepository(this._sportDataSource);

  Future<void> fetchAllSports() async {
    try {
      final sportsData = await _sportDataSource.getSports();
      _sports.addAll(sportsData);
    } catch (e) {
      print('Error fetching sports: $e');
    }
  }

  List<Sport> get sports => _sports;
}
