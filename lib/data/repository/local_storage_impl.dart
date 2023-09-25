import 'package:practice_shopping_app/data/data_source/local/local_data_source.dart';
import 'package:practice_shopping_app/domain/entities/shopping_item.dart';
import 'package:practice_shopping_app/domain/repository/local_storage__repo.dart';

class LocalDataRepositoryImpl implements LocalDataRepository {
  final LocalDataSource localStorageDataSource;

  LocalDataRepositoryImpl({required this.localStorageDataSource});

  @override
  Future<void> saveOrders(List<ShoppingItemEntity> currCart) {
    return localStorageDataSource.saveOrders(currCart);
  }

  @override
  List<String> convertToStringList(List<ShoppingItemEntity> current) {
    return localStorageDataSource.convertToStringList(current);
  }

  @override
  Future<List<List<ShoppingItemEntity>>> loadOrder() {
    return localStorageDataSource.loadOrder();
  }
}
