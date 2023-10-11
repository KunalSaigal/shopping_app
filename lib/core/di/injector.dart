import 'package:kiwi/kiwi.dart';
import 'package:practice_shopping_app/features/fetch_order/presentation/bloc/order_bloc.dart';
import 'package:practice_shopping_app/features/fetch_shopping_list/data/data_source/remote/remote_data_source.dart';
import 'package:practice_shopping_app/features/fetch_shopping_list/data/repository/remote_item_fetching_repo_impl.dart';
import 'package:practice_shopping_app/features/fetch_shopping_list/domain/repository/remote_item_fetching_repo.dart';
import 'package:practice_shopping_app/features/fetch_order/domain/use_case/local_data_usecase.dart';
import 'package:practice_shopping_app/features/show_cart/presentaion/bloc/cart_bloc.dart';

import '../../features/fetch_order/data/data_source/local/local_data_source.dart';
import '../../features/fetch_order/data/repository/local_storage_impl.dart';
import '../../features/fetch_order/domain/repository/local_storage__repo.dart';
import '../../features/fetch_shopping_list/domain/use_cases/remote_data_usecase.dart';
import '../../features/fetch_shopping_list/presentation/bloc/shopping_bloc.dart';

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
