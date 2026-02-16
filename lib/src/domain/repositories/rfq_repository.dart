import '../entities/rfq.dart';

abstract class RfqRepository {
  Future<List<Rfq>> getRfqs();
  Future<Rfq> getRfqById(String id);
}