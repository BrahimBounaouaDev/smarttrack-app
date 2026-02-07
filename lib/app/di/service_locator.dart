import 'package:get_it/get_it.dart';

import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // Repositories
  locator.registerLazySingleton(() => AuthRepositoryImpl());

  // UseCases
  locator.registerLazySingleton(() => LoginUseCase(locator()));
}