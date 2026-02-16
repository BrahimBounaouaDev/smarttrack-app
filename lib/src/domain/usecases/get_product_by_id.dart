/*import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smarttoil/di/injection.dart';
import 'package:smarttoil/src/domain/entities/product.dart';

final productByIdProvider =
    FutureProvider.family<Product, String>((ref, id) async {
  final usecase = getIt<>();
  return usecase(id);
});
*/

import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProductById {
  final ProductRepository repository;

  GetProductById(this.repository);

  Future<Product> call(String id) {
    return repository.getProductById(id);
  }
}