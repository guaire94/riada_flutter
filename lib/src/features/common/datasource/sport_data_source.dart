import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:riada/src/features/common/datasource/base_firestore_data_source.dart';
import 'package:riada/src/features/common/datasource/exceptions/no_data_available_exception.dart';
import 'package:riada/src/features/event/entity/sport.dart';

@injectable
class SportDataSource extends BaseFirestoreDataSource {
  // MARK: - LifeCycle
  SportDataSource({
    required super.envConfigurationDataSource,
  });

  // MARK: - Public
  Future<List<Sport>> getSports() async {
    try {
      Query query = await sportCollection().orderBy("rank");

      final querySnapshot = await query.get();
      return querySnapshot.docs.map((sport) {
        final data = sport.data() as Map<String, dynamic>?;
        if (data == null) {
          throw NoDataAvailableException();
        }
        data["id"] = sport.id;
        return Sport.fromJson(data);
      }).toList();
    } catch (_) {
      return [];
    }
  }
}
