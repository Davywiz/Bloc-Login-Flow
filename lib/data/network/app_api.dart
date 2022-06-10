import 'package:dio/dio.dart';
import 'package:login_flow_bloc/app/constants.dart';
import 'package:login_flow_bloc/data/response/responses.dart';
import 'package:retrofit/retrofit.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST('/auth/signup')
  Future<HttpResponse<RegisterResponse>> register(
    @Field("email") String email,
    @Field("password") String password,
    @Field("name") String name,
  );

  @POST('/auth/login')
  Future<HttpResponse<LoginResponse>> login(
    @Field("email") String email,
    @Field("password") String password,
  );
}
