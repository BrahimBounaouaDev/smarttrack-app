


import 'package:smarttoil/di/injection.dart';
import 'package:smarttoil/src/domain/entities/profile.dart';
import 'package:smarttoil/src/domain/usecases/get_profile.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
final profileProvider = FutureProvider<Profile>((ref) async {
  return getIt<GetProfile>()();
});