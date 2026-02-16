
import 'package:smarttoil/di/injection.dart';
import 'package:smarttoil/src/domain/entities/order.dart';
import 'package:smarttoil/src/domain/usecases/get_orders.dart';
import 'package:smarttoil/src/domain/usecases/get_order_by_id.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ordersProvider = FutureProvider<List<Order>>((ref) async {
  return getIt<GetOrders>()();
});

final orderByIdProvider =
    FutureProvider.family<Order, String>((ref, id) async {
  return getIt<GetOrderById>()(id);
});