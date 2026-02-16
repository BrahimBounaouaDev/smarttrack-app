import 'package:smarttoil/src/domain/entities/profile.dart';
import 'package:smarttoil/src/domain/repositories/profile_repository.dart';

import '../datasources/local/local_data_source.dart';
import '../models/profile_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final LocalDataSource localDataSource;

  ProfileRepositoryImpl(this.localDataSource);

  @override
  Future<Profile> getProfile() async {
    final ProfileModel model = await localDataSource.loadProfile();
    return model.toEntity();
  }
}