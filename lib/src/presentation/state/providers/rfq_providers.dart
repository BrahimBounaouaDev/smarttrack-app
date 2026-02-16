

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smarttoil/di/injection.dart';
import 'package:smarttoil/src/domain/entities/rfq.dart';
import 'package:smarttoil/src/domain/usecases/get_rfqs.dart';
import 'package:smarttoil/src/domain/usecases/get_rfq_by_id.dart';


final rfqsProvider = FutureProvider<List<Rfq>>((ref) async {
  return getIt<GetRfqs>()();
});

final rfqByIdProvider =
    FutureProvider.family<Rfq, String>((ref, id) async {
  return getIt<GetRfqById>()(id);
});