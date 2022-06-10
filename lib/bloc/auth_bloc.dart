import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_flow_bloc/app/app_prefs.dart';
import 'package:login_flow_bloc/app/di.dart';
import 'package:login_flow_bloc/data/repository/repository.dart';
import 'package:login_flow_bloc/data/requests/requests.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final Repository _repository;
  late final AppPreferences _appPreferences;

  AuthBloc(this._repository, this._appPreferences)
      : super(AuthLogin(isLoading: false)) {
    on<AppInitializeEvent>((event, emit) async {
      final bool isUserLoggedIn = await _appPreferences.isUserLoggedIn();
      if (isUserLoggedIn) {
        emit(const AuthSuccessState(isLoading: false, isLogin: true));
      } else {
        emit(const AuthLogin(isLoading: false));
      }
    });

    on<GoToRegistrationEvent>((event, emit) {
      emit(const AuthSignUp(isLoading: false));
    });

    on<GoToLoginEvent>((event, emit) {
      emit(const AuthLogin(isLoading: false));
    });

    on<LoginEvent>((event, emit) async {
      emit(const AuthLogin(isLoading: true));
      final loginRequest = LoginRequest(event.email, event.password);
      (await _repository.login(loginRequest)).fold((left) {
        emit(AuthLogin(isLoading: false, authError: left.message));
      }, (right) {
        _appPreferences.setToken(right.token);
        _appPreferences.setIsUserLoggedIn();
        resetAllModule();
        emit(const AuthSuccessState(isLoading: false, isLogin: true));
      });
    });

    on<SignUpEvent>((event, emit) async {
      emit(const AuthSignUp(isLoading: true));
      final registerRequest =
          RegisterRequest(event.email, event.name, event.password);
      (await _repository.register(registerRequest)).fold((left) {
        emit(AuthSignUp(isLoading: false, authError: left.message));
      }, (right) {
        emit(const AuthSuccessState(isLoading: false, isLogin: false));
      });
    });

    on<LogOutEvent>((event, emit) {
      _appPreferences.clearToken();
      _appPreferences.clearUserLoggedIn();
      emit(const AuthLogin(isLoading: false));
    });
  }

  Future<bool> getUserLoggedIn() async {
    final bool isUserLoggedIn = await _appPreferences.isUserLoggedIn();
    return isUserLoggedIn;
    
  }
}
