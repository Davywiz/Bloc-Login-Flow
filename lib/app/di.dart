import 'package:get_it/get_it.dart';
import 'package:login_flow_bloc/app/app_prefs.dart';
import 'package:login_flow_bloc/bloc/auth_bloc.dart';
import 'package:login_flow_bloc/data/data_source/remote_data_source.dart';
import 'package:login_flow_bloc/data/network/app_api.dart';
import 'package:login_flow_bloc/data/network/dio_factory.dart';
import 'package:login_flow_bloc/data/repository/repository.dart';
import 'package:login_flow_bloc/data/repository/repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

// shared prefs instance
  instance.registerLazySingleton(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  //dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  //app service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementer(instance()));

  //repository
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(
        instance(),
      ));

  //bloc
  instance.registerLazySingleton<AuthBloc>(() => AuthBloc(
        instance(),
        instance(),
      ));
}

resetAllModule() {
  instance.reset(dispose: false);
  initAppModule();
}
