import 'package:practice_shopping_app/features/fetch_shopping_list/data/data_source/remote/remote_data_source.dart';
import 'package:practice_shopping_app/features/common/entities/shopping_item.dart';
import 'package:practice_shopping_app/features/fetch_shopping_list/domain/repository/remote_item_fetching_repo.dart';

class RemoteDataRepositoryImpl implements RemoteDataRepository {
  final RemoteDataSource remoteDataSource;
  RemoteDataRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ShoppingItemEntity>> getDatafromDio() {
    return remoteDataSource.getDatafromDio();
  }
}
