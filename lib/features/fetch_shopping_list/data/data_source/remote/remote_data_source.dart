import 'package:dio/dio.dart';

import '../../../../common/entities/shopping_item.dart';
import '../../../../common/data_model/data_model.dart';

class RemoteDataSource {
  List<ShoppingItemEntity> shopItems = [];
  Future<List<ShoppingItemEntity>> getDatafromDio() async {
    Dio dio = Dio();
    dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, h) {
          for (Map m in response.data) {
            shopItems.add(ShoppingListModel.getData(m));
          }
          return h.next(response);
        },
      ),
    );
    try {
      Response response = await dio.get("https://fakestoreapi.com/products");

      if (response.statusCode == 200) {
        return shopItems;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
