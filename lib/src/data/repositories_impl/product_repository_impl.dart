import 'package:smarttoil/src/domain/entities/product.dart';
import 'package:smarttoil/src/domain/repositories/product_repository.dart';

import '../datasources/local/local_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final LocalDataSource localDataSource;

  ProductRepositoryImpl(this.localDataSource);

  @override
  Future<List<Product>> getProducts() async {
    final List<ProductModel> models = await localDataSource.loadProducts();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Product> getProductById(String id) async {
    final List<ProductModel> models = await localDataSource.loadProducts();
    final model = models.firstWhere((m) => m.id == id);
    return model.toEntity();
  }
}