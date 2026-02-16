import 'package:get_it/get_it.dart';

import '../src/data/datasources/local/local_data_source.dart';
import '../src/data/repositories_impl/product_repository_impl.dart';
import '../src/data/repositories_impl/order_repository_impl.dart';
import '../src/data/repositories_impl/rfq_repository_impl.dart';
import '../src/data/repositories_impl/profile_repository_impl.dart';

import '../src/domain/repositories/product_repository.dart';
import '../src/domain/repositories/order_repository.dart';
import '../src/domain/repositories/rfq_repository.dart';
import '../src/domain/repositories/profile_repository.dart';

import '../src/domain/usecases/get_products.dart';
import '../src/domain/usecases/get_orders.dart';
import '../src/domain/usecases/get_rfqs.dart';
import '../src/domain/usecases/get_profile.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // DATA SOURCES
  getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  // REPOSITORIES
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(getIt<LocalDataSource>()),
  );

  getIt.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(getIt<LocalDataSource>()),
  );

  getIt.registerLazySingleton<RfqRepository>(
    () => RfqRepositoryImpl(getIt<LocalDataSource>()),
  );

  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(getIt<LocalDataSource>()),
  );

  // USECASES
  getIt.registerLazySingleton(() => GetProducts(getIt<ProductRepository>()));
 
  getIt.registerLazySingleton(() => GetOrders(getIt<OrderRepository>()));
  getIt.registerLazySingleton(() => GetRfqs(getIt<RfqRepository>()));
  getIt.registerLazySingleton(() => GetProfile(getIt<ProfileRepository>()));
}