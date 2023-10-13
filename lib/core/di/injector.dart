import 'package:kiwi/kiwi.dart';

import '../../features/cart_feature/presentaion/bloc/cart_bloc.dart';
import '../../features/order_feature/data/data_source/local/local_data_source.dart';
import '../../features/order_feature/data/repository/local_storage_impl.dart';
import '../../features/order_feature/domain/repository/local_storage__repo.dart';
import '../../features/order_feature/domain/use_case/local_data_usecase.dart';
import '../../features/order_feature/presentation/bloc/order_bloc.dart';
import '../../features/shopping_feature/data/data_source/remote/remote_data_source.dart';
import '../../features/shopping_feature/data/repository/remote_item_fetching_repo_impl.dart';
import '../../features/shopping_feature/domain/repository/remote_item_fetching_repo.dart';
import '../../features/shopping_feature/domain/use_cases/remote_data_usecase.dart';
import '../../features/shopping_feature/presentation/bloc/shopping_bloc.dart';

part "injector.g.dart";

abstract class Injector {
  static KiwiContainer? container;
  static void setup() {
    container = KiwiContainer();
    _$Injector()._configure();
  }

  static Function<T>([String? name]) get resolve => container!.resolve;

  @Register.singleton(LocalDataRepository, from: LocalDataRepositoryImpl)
  @Register.singleton(RemoteDataRepository, from: RemoteDataRepositoryImpl)
  @Register.singleton(LocalDataUseCase)
  @Register.singleton(RemoteDataUseCase)
  @Register.singleton(RemoteDataSource)
  @Register.singleton(LocalDataSource)
  @Register.factory(ShoppingBloc)
  @Register.factory(OrderBloc)
  @Register.factory(CartBloc)
  void _configure();
}
