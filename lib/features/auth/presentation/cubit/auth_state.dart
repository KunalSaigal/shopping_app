part of 'auth_cubit.dart';

@immutable
sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

// ignore: must_be_immutable
class AuthCompletionState extends AuthState {
  final UserCredential userCred;
  const AuthCompletionState({
    required this.userCred,
  });

  @override
  List<Object> get props => [userCred];
}

class AuthErrorState extends AuthState {}
