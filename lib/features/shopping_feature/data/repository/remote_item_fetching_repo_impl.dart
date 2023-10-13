import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../common/entities/shopping_item.dart';
import '../../domain/repository/remote_item_fetching_repo.dart';
import '../data_source/remote/remote_data_source.dart';

class RemoteDataRepositoryImpl implements RemoteDataRepository {
  final RemoteDataSource remoteDataSource;
  RemoteDataRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<List<ShoppingItemEntity>, Failure>> getDatafromDio() {
    return remoteDataSource.getDatafromDio();
  }
}
