import 'package:smarttoil/src/domain/entities/order.dart';
import 'package:smarttoil/src/domain/repositories/order_repository.dart';

import '../datasources/local/local_data_source.dart';
import '../models/order_model.dart';

class OrderRepositoryImpl implements OrderRepository {
  final LocalDataSource localDataSource;

  OrderRepositoryImpl(this.localDataSource);

  @override
  Future<List<Order>> getOrders() async {
    final List<OrderModel> models = await localDataSource.loadOrders();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Order> getOrderById(String id) async {
    final List<OrderModel> models = await localDataSource.loadOrders();
    final model = models.firstWhere((m) => m.id == id);
    return model.toEntity();
  }
}