import '../../../common/entities/shopping_item.dart';

abstract class LocalDataRepository {
  Future<void> saveOrders(List<ShoppingItemEntity> currCart);

  // List<String> convertToStringList(List<ShoppingItemEntity> current);

  Future<List<List<ShoppingItemEntity>>> loadOrder();
}
