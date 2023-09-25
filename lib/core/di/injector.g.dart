// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton<LocalDataRepository>((c) =>
          LocalDataRepositoryImpl(localStorageDataSource: c<LocalDataSource>()))
      ..registerSingleton<RemoteDataRepository>((c) =>
          RemoteDataRepositoryImpl(remoteDataSource: c<RemoteDataSource>()))
      ..registerSingleton((c) =>
          LocalDataUseCase(localDataRepository: c<LocalDataRepository>()))
      ..registerSingleton((c) =>
          RemoteDataUseCase(remoteDataRepository: c<RemoteDataRepository>()))
      ..registerSingleton((c) => RemoteDataSource())
      ..registerSingleton((c) => LocalDataSource())
      ..registerFactory((c) => ShoppingBloc(
          localDataUseCase: c<LocalDataUseCase>(),
          remoteDataUseCase: c<RemoteDataUseCase>()));
  }
}
