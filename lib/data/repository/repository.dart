import 'package:dartz/dartz.dart';
import 'package:login_flow_bloc/data/network/failure.dart';
import 'package:login_flow_bloc/data/requests/requests.dart';
import 'package:login_flow_bloc/models/model.dart';

abstract class Repository {
  Future<Either<Failure, AuthData>> login(LoginRequest loginRequest);
  Future<Either<Failure, bool>> register(RegisterRequest registerRequest);
}

