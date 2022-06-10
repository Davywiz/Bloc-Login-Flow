import 'package:dartz/dartz.dart';
import 'package:login_flow_bloc/data/data_source/remote_data_source.dart';
import 'package:login_flow_bloc/data/mapper/mapper.dart';
import 'package:login_flow_bloc/data/network/error_handler.dart';
import 'package:login_flow_bloc/data/network/failure.dart';
import 'package:login_flow_bloc/data/repository/repository.dart';
import 'package:login_flow_bloc/data/requests/requests.dart';
import 'package:login_flow_bloc/models/model.dart';

class RepositoryImpl implements Repository {
  RemoteDataSource _remoteDataSource;
  RepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, AuthData>> login(LoginRequest loginRequest) async {
    try {
      final serverData = await _remoteDataSource.login(loginRequest);
      int serverStatus =
          serverData.response.statusCode ?? ApiInternalStatus.FAILURE;
      if (serverStatus == 200 || serverStatus == 201) {
        return Right(serverData.data.toDomain());
      } else {
        return Left(Failure(serverStatus,
            serverData.response.statusMessage ?? ResponseMessage.UNKNOWN));
      }
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> register(
      RegisterRequest registerRequest) async {
    try {
      final serverData = await _remoteDataSource.register(registerRequest);
      int? serverStatus =
          serverData.response.statusCode ?? ApiInternalStatus.FAILURE;
      if (serverStatus == 200 || serverStatus == 201) {
        return const Right(true);
      } else {
        return Left(Failure(serverStatus,
            serverData.response.statusMessage ?? ResponseMessage.UNKNOWN));
      }
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
