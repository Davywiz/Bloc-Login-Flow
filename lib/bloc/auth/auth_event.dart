part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class GoToRegistrationEvent extends AuthEvent {
  const GoToRegistrationEvent();
}

class GoToLoginEvent extends AuthEvent {
  const GoToLoginEvent();
}

class AppInitializeEvent extends AuthEvent {
  const AppInitializeEvent();
}

class LogOutEvent extends AuthEvent {
  const LogOutEvent();
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  const LoginEvent({
    required this.email,
    required this.password,
  });
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String name;
  final String password;
  const SignUpEvent({
    required this.email,
    required this.name,
    required this.password,
  });
}
