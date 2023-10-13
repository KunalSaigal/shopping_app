import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../common/entities/shopping_item.dart';
import '../repository/remote_item_fetching_repo.dart';

class RemoteDataUseCase {
  final RemoteDataRepository remoteDataRepository;

  RemoteDataUseCase({required this.remoteDataRepository});

  Future<Either<List<ShoppingItemEntity>, Failure>> getDatafromDio() {
    return remoteDataRepository.getDatafromDio();
  }
}
