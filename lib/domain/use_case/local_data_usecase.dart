import 'package:practice_shopping_app/domain/entities/shopping_item.dart';
import 'package:practice_shopping_app/domain/repository/local_storage__repo.dart';

class LocalDataUseCase {
  final LocalDataRepository localDataRepository;
  LocalDataUseCase({required this.localDataRepository});

  Future<void> saveOrders(List<ShoppingItemEntity> currCart) {
    return localDataRepository.saveOrders(currCart);
  }

  List<String> convertToStringList(List<ShoppingItemEntity> current) {
    return localDataRepository.convertToStringList(current);
  }

  Future<List<List<ShoppingItemEntity>>> loadOrder() {
    return localDataRepository.loadOrder();
  }
}
