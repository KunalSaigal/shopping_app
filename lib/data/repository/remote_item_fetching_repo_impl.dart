import 'package:practice_shopping_app/data/data_source/remote/remote_data_source.dart';
import 'package:practice_shopping_app/domain/entities/shopping_item.dart';
import 'package:practice_shopping_app/domain/repository/remote_item_fetching_repo.dart';

class RemoteDataRepositoryImpl implements RemoteDataRepository {
  final RemoteDataSource remoteDataSource;
  RemoteDataRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ShoppingItemEntity>> getDatafromDio() {
    return remoteDataSource.getDatafromDio();
  }
}
