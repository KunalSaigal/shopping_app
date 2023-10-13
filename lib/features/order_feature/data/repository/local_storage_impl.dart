import 'package:practice_shopping_app/features/common/entities/shopping_item.dart';

import '../../domain/repository/local_storage__repo.dart';
import '../data_source/local/local_data_source.dart';

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
