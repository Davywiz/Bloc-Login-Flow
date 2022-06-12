// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final bool isLoading;
  final String? authError;
  const AuthState({
    required this.isLoading,
    this.authError,
  });

  @override
  List<Object?> get props => [isLoading, authError];
}

class AuthLogin extends AuthState {
  const AuthLogin({required super.isLoading, super.authError});
}

class AuthSignUp extends AuthState {
  const AuthSignUp({required super.isLoading, super.authError});
}

class AuthSuccessState extends AuthState {
  final bool isLogin;
  const AuthSuccessState(
      {required super.isLoading, super.authError, required this.isLogin});
}
