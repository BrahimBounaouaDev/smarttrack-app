import 'package:smarttoil/src/domain/entities/rfq.dart';
import 'package:smarttoil/src/domain/repositories/rfq_repository.dart';

import '../datasources/local/local_data_source.dart';
import '../models/rfq_model.dart';

class RfqRepositoryImpl implements RfqRepository {
  final LocalDataSource localDataSource;

  RfqRepositoryImpl(this.localDataSource);

  @override
  Future<List<Rfq>> getRfqs() async {
    final List<RfqModel> models = await localDataSource.loadRfqs();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Rfq> getRfqById(String id) async {
    final List<RfqModel> models = await localDataSource.loadRfqs();
    final model = models.firstWhere((m) => m.id == id);
    return model.toEntity();
  }
}