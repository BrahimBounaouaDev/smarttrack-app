import '../entities/rfq.dart';
import '../repositories/rfq_repository.dart';

class GetRfqs {
  final RfqRepository repository;

  GetRfqs(this.repository);

  Future<List<Rfq>> call() {
    return repository.getRfqs();
  }
}