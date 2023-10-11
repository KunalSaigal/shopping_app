import 'package:practice_shopping_app/features/fetch_shopping_list/domain/repository/remote_item_fetching_repo.dart';

import '../../../common/entities/shopping_item.dart';

class RemoteDataUseCase {
  final RemoteDataRepository remoteDataRepository;

  RemoteDataUseCase({required this.remoteDataRepository});

  Future<List<ShoppingItemEntity>> getDatafromDio() {
    return remoteDataRepository.getDatafromDio();
  }
}
