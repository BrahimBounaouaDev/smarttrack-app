/*import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smarttoil/di/injection.dart';
import 'package:smarttoil/src/domain/entities/product.dart';
import 'package:smarttoil/src/domain/usecases/get_products.dart';
import 'package:smarttoil/src/domain/usecases/get_product_by_id.dart';


final productsProvider = FutureProvider<List<Product>>((ref) async {
  final usecase = getIt<GetProducts>();
  return usecase();
});

final productByIdProvider =
    FutureProvider.family<Product, String>((ref, id) async {
  final usecase = getIt<getProductbyId>();
  return usecase(id);
});*/
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smarttoil/di/injection.dart';
import 'package:smarttoil/src/domain/entities/product.dart';
import 'package:smarttoil/src/domain/usecases/get_products.dart';
import 'package:smarttoil/src/domain/usecases/get_product_by_id.dart';

final productsProvider = FutureProvider<List<Product>>((ref) async {
  final usecase = getIt<GetProducts>();
  return usecase();
});

final productByIdProvider =
    FutureProvider.family<Product, String>((ref, id) async {
  final usecase = getIt<GetProductById>();
  return usecase(id);
});