import '../entities/rfq.dart';
import '../repositories/rfq_repository.dart';

class GetRfqById {
  final RfqRepository repository;

  GetRfqById(this.repository);

  Future<Rfq> call(String id) {
    return repository.getRfqById(id);
  }
}