import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/data_model/data_model.dart';
import '../../../../common/entities/shopping_item.dart';

class LocalDataSource {
  late SharedPreferences _preferences;
  late List<ShoppingItemEntity> cartItemInstance;

  Future<void> saveOrders(List<ShoppingItemEntity> currCart) async {
    _preferences = await SharedPreferences.getInstance();
    List<List<ShoppingItemEntity>> localOrderList = await loadOrder();
    localOrderList.insert(
      0,
      currCart.map(
        (itemInstance) {
          return itemInstance.toModel();
        },
      ).toList(),
    );

    final saving = localOrderList.map(
      (itemList) {
        return itemList.map(
          (item) {
            return item.toModel().toJSON();
          },
        ).toList();
      },
    ).toList();
    String saveOrder = jsonEncode(saving);

    await _preferences.setString("savedCart", saveOrder);
  }

  Future<List<List<ShoppingItemEntity>>> loadOrder() async {
    _preferences = await SharedPreferences.getInstance();
    final savedString = _preferences.getString("savedCart") ?? "";
    if (savedString != "") {
      List<dynamic> decodeSaved = jsonDecode(savedString);

      return decodeSaved.map(
        (listofEle) {
          return (listofEle as List).map(
            (jsonMap) {
              return ShoppingListModel.getData(jsonMap);
            },
          ).toList();
        },
      ).toList();
    } else {
      return [];
    }
  }
}
