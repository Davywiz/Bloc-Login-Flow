import 'package:login_flow_bloc/data/network/app_api.dart';
import 'package:login_flow_bloc/data/requests/requests.dart';
import 'package:login_flow_bloc/data/response/responses.dart';
import 'package:retrofit/retrofit.dart';

abstract class RemoteDataSource {
  Future<HttpResponse<LoginResponse>> login(LoginRequest loginRequest);
  Future<HttpResponse<RegisterResponse>> register(
      RegisterRequest registerRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  AppServiceClient _appServiceClient;
  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<HttpResponse<LoginResponse>> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<HttpResponse<RegisterResponse>> register(
      RegisterRequest registerRequest) async {
    return await _appServiceClient.register(
        registerRequest.email, registerRequest.password, registerRequest.name);
  }
}
