import 'package:practice_shopping_app/features/common/entities/shopping_item.dart';

import '../repository/local_storage__repo.dart';

class LocalDataUseCase {
  final LocalDataRepository localDataRepository;
  LocalDataUseCase({required this.localDataRepository});

  Future<void> saveOrders(List<ShoppingItemEntity> currCart) {
    return localDataRepository.saveOrders(currCart);
  }

  Future<List<List<ShoppingItemEntity>>> loadOrder() {
    return localDataRepository.loadOrder();
  }
}
