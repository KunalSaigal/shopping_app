import 'package:practice_shopping_app/data/data_model/data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final List<ShoppingListModel> currentCart;
  final List<List<ShoppingListModel>> orders;
  LocalStorage(this.currentCart, {required this.orders});

  late SharedPreferences _preferences;
  late List<ShoppingListModel> cartItemInstance;
  // late final List<ShoppingListModel>? last_cart;

  void saveCart(List<ShoppingListModel> current) async {
    _preferences = await SharedPreferences.getInstance();
    for (int i = 0; i < current.length; i++) {
      final key = 'currentCart_$i';
      final value =
          '${current[i].id},${current[i].title},${current[i].description},${current[i].price},${current[i].category},${current[i].image},${current[i].itemQuantity}';
      await _preferences.setString(key, value);
    }
  }

  Future<List<ShoppingListModel>> _loadCart() async {
    _preferences = await SharedPreferences.getInstance();
    final keys = _preferences.getKeys();
    final lastCart = <ShoppingListModel>[];
    for (final key in keys) {
      final value = _preferences.getString(key);
      if (value != null) {
        final parts = value.split(',');
        if (parts.length == 2) {
          final id = int.parse(parts[0]);
          final title = parts[1];
          final description = parts[2];
          final price = double.parse(parts[3]);
          final category = parts[4];
          final image = parts[5];
          final itemQuantity = int.parse(parts[6]);
          lastCart.add(ShoppingListModel(
              id: id,
              title: title,
              description: description,
              price: price,
              category: category,
              image: image,
              itemQuantity: itemQuantity));
        }
      }
    }
    return lastCart;
  }
}
