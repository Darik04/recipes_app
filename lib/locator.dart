import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:recipes_app/bloc/main/main_bloc.dart';

final sl = GetIt.instance;

void setupInjections() {

  // //Main config of system
  // sl.registerLazySingleton<MainConfigApp>(() => MainConfigApp());


  // //! External
  // sl.registerLazySingleton(() => InternetConnectionChecker());
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // sl.registerFactory<Dio>(
  //   () => Dio(BaseOptions(
  //     baseUrl: Config.url.url,
  //   )),
  // );

  // ///Authentication
  // sl.registerLazySingleton<AuthConfig>(() => AuthConfig());
  // //Datasources
  // sl.registerLazySingleton<AuthenticationRemoteDataSource>(
  //   () => AuthenticationRemoteDataSourceImpl(dio: sl()),
  // );
  // sl.registerLazySingleton<AuthenticationLocalDataSource>(
  //   () => AuthenticationLocalDataSourceImpl(),
  // );
  // sl.registerLazySingleton<PushNotificationsServiceRemoteDataSource>(
  //   () => PushNotificationsServiceRemoteDataSourceImpl(dio: sl()),
  // );

  // //Repositories
  // sl.registerLazySingleton<LoginRepository>(
  //   () => LoginRepositoryImpl(sl(), sl(), sl(), sl()),
  // );

  // //UseCases
  // sl.registerLazySingleton(() => AuthSignIn(sl()));
  // sl.registerLazySingleton(() => AuthRegister(sl()));
  // sl.registerLazySingleton(() => GetUserInfo(sl()));
  // sl.registerLazySingleton(() => GetTokenLocal(sl()));
  // sl.registerLazySingleton(() => Logout(sl()));
  // sl.registerLazySingleton(() => GetCities(sl()));

  // //Blocs
  // sl.registerFactory<AuthBloc>(
  //   () => AuthBloc(sl(), sl(), sl(), sl(), sl(), sl()),
  // );
  //  sl.registerFactory<MainScreenBloc>(
  //   () => MainScreenBloc(),
  // );



  sl.registerFactory<MainBloc>(
    () => MainBloc(),
  );
}
