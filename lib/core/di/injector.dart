import 'package:kiwi/kiwi.dart';
import 'package:practice_shopping_app/data/data_source/local/local_data_source.dart';
import 'package:practice_shopping_app/data/data_source/remote/remote_data_source.dart';
import 'package:practice_shopping_app/data/repository/local_storage_impl.dart';
import 'package:practice_shopping_app/data/repository/remote_item_fetching_repo_impl.dart';
import 'package:practice_shopping_app/domain/repository/local_storage__repo.dart';
import 'package:practice_shopping_app/domain/repository/remote_item_fetching_repo.dart';
import 'package:practice_shopping_app/domain/use_case/local_data_usecase.dart';

import '../../domain/use_case/remote_data_usecase.dart';
import '../../presentation/state_management/bloc/shopping_bloc.dart';

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
  void _configure();
}
