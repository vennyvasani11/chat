

import 'package:chat/utils/prefutils.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerSingletonAsync<SharedPreferences>(() => PreferenceUtils.init());

  // sl.registerSingletonWithDependencies<SharedPreferenceModule>(
  //   () => SharedPreferenceModule(pref: sl<SharedPreferences>()),
  //   dependsOn: [SharedPreferences]
  // );

  // //interceptor
  // sl.registerSingletonWithDependencies<RequestInterceptor>(
  //     () => RequestInterceptor(pref: sl()),
  //     dependsOn: [SharedPreferenceModule]
  // );

  // //module
  // sl.registerLazySingleton<Dio>(() => NetworkModule(requestInterceptor: sl()).provideDio());

  //   //================================================================================ ////datasource
  // sl.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl());

//
//   //   //================================================================================ //// //repositories
  // sl.registerLazySingleton<LoginRepository>(
  //     () => LoginRespositoryImpl(baseLoginDataSource: sl()));

//   //   //================================================================================ //// //use cases
  // sl.registerLazySingleton(() => LoginUseCase(baseLoginRespository: sl()));

//   //================================================================================ // //blocs
  // sl.registerFactory(() => IntroBloc());
 

//================================================================================ // //blocs
}
