part of 'shopping_bloc.dart';

@immutable
sealed class ShoppingState {}

class ListFetchingState extends ShoppingState {}

class ListFetchingSuccessfullState extends ShoppingState {
  final List<ShoppingListModel> shoppinglist;
  ListFetchingSuccessfullState({required this.shoppinglist});
}
