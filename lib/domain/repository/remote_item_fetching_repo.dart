import '../entities/shopping_item.dart';

abstract class RemoteDataRepository {
  Future<List<ShoppingItemEntity>> getDatafromDio();
}
