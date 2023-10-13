import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../common/entities/shopping_item.dart';

abstract class RemoteDataRepository {
  Future<Either<List<ShoppingItemEntity>, Failure>> getDatafromDio();
}
