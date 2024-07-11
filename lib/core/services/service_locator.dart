import 'package:fitness/ui/Manifestation/data/datasource/manifestation_data_source.dart';
import 'package:fitness/ui/Manifestation/data/repos_impl/manifestation_repository_impl.dart';
import 'package:fitness/ui/Manifestation/domain/repos/manifestation_repos.dart';
import 'package:fitness/ui/Manifestation/domain/usecases/manifestation_usecases.dart';
import 'package:fitness/ui/Manifestation/view/bloc/manifestation_bloc.dart';
import 'package:fitness/ui/activity/data/datasource/face_care_data_source.dart';
import 'package:fitness/ui/activity/data/repos_impl/activity_repository_impl.dart';
import 'package:fitness/ui/activity/domain/repos/activity_repos.dart';
import 'package:fitness/ui/activity/domain/usecases/activity_usecases.dart';
import 'package:fitness/ui/activity/view/bloc/activity_bloc.dart';
import 'package:fitness/ui/edit_goal/view/bloc/edit_goal_bloc.dart';
import 'package:fitness/ui/edit_profile/data/datasource/edit_profile_data_source.dart';
import 'package:fitness/ui/edit_profile/data/repos_impl/edit_profile_repository_impl.dart';
import 'package:fitness/ui/edit_profile/domain/repos/edit_profile_repos.dart';
import 'package:fitness/ui/edit_profile/domain/usecases/edit_profile_usecases.dart';
import 'package:fitness/ui/edit_profile/screen/bloc/edit_profile_bloc.dart';
import 'package:fitness/ui/facecare/data/datasource/face_care_data_source.dart';
import 'package:fitness/ui/facecare/data/repos_impl/face_care_repository_impl.dart';
import 'package:fitness/ui/facecare/domain/repos/face_care_repos.dart';
import 'package:fitness/ui/facecare/domain/usecases/face_care_usecases.dart';
import 'package:fitness/ui/facecare/view/bloc/face_care_bloc.dart';
import 'package:fitness/ui/home/view/bloc/home_bloc.dart';
import 'package:fitness/ui/intro/view/bloc/intro_bloc.dart';
import 'package:fitness/ui/login/view/bloc/login_bloc.dart';
import 'package:fitness/ui/main_home/view/bloc/main_home_bloc.dart';
import 'package:fitness/ui/meal_plan/data/datasource/meal_plan_data_source.dart';
import 'package:fitness/ui/meal_plan/data/repos_impl/meal_plan_repository_impl.dart';
import 'package:fitness/ui/meal_plan/domain/repos/meal_plan_repos.dart';
import 'package:fitness/ui/meal_plan/domain/usecases/meal_plan_usecases.dart';
import 'package:fitness/ui/meal_plan/view/bloc/meal_plan_bloc.dart';
import 'package:fitness/ui/question_step/data/datasource/question_step_data_source.dart';
import 'package:fitness/ui/question_step/data/repos_impl/question_step_repository_impl.dart';
import 'package:fitness/ui/question_step/domain/repos/question_step_repos.dart';
import 'package:fitness/ui/question_step/domain/usecases/question_step_usecases.dart';
import 'package:fitness/ui/question_step/view/bloc/question_step_bloc.dart';
import 'package:fitness/ui/work_out/data/datasource/workout_data_source.dart';
import 'package:fitness/ui/work_out/data/repos_impl/workout_repository_impl.dart';
import 'package:fitness/ui/work_out/domain/repos/workout_repos.dart';
import 'package:fitness/ui/work_out/domain/usecases/workout_usecases.dart';
import 'package:fitness/ui/work_out/view/bloc/workout_bloc.dart';
import 'package:fitness/ui/workout_prefrences/view/bloc/workout_prefrence_bloc.dart';
import 'package:fitness/utils/prefutils.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ui/login/data/datasource/login_data_source.dart';
import '../../ui/login/data/repos_impl/login_repository_impl.dart';
import '../../ui/login/domain/repos/login_repos.dart';
import '../../ui/login/domain/usecases/login_usecases.dart';

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
  sl.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl());
  sl.registerLazySingleton<QuestionStepDataSource>(
      () => QuestionStepDataSourceImpl());
  sl.registerLazySingleton<ManifestationDataSource>(
      () => ManifestationDataSourceImpl());
  sl.registerLazySingleton<WorkOutDataSource>(() => WorkOutDataSourceImpl());
  sl.registerLazySingleton<FaceCareDataSource>(() => FaceCareDataSourceImpl());
  sl.registerLazySingleton<MealPlanDataSource>(() => MealPlanDataSourceImpl());
  sl.registerLazySingleton<ActivityDataSource>(() => ActivityDataSourceImpl());
  sl.registerLazySingleton<EditProfileDataSource>(
      () => EditProfileDataSourceImpl());
//   sl.registerLazySingleton<ContactSellerDataSource>(
//       () => ContactSellerDataSourceImpl());
//   sl.registerLazySingleton<ChatListingDataSource>(
//       () => ChatListingDataSourceImpl());
//   sl.registerLazySingleton<TradeCenterDataSource>(
//       () => TradeCenterDataSourceImpl());
//   sl.registerLazySingleton<HomeDataSource>(() => HomeDataSourceImpl());
//
//   sl.registerLazySingleton<PriceDataSource>(() => PriceDataSourceImpl());
//   sl.registerLazySingleton<BuyRequestDataSource>(
//       () => BuyRequestDataSourceImpl());
//   sl.registerLazySingleton<ItemListDataSource>(() => ItemListDataSourceImpl());
//
//   //   //================================================================================ //// //repositories
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRespositoryImpl(baseLoginDataSource: sl()));
  sl.registerLazySingleton<QuestionStepRepository>(
      () => QuestionStepRespositoryImpl(baseQuestionStepDataSource: sl()));
  sl.registerLazySingleton<ManifestationRepository>(
      () => ManifestationRepositoryImpl(manifestationDataSource: sl()));
  sl.registerLazySingleton<WorkOutRepository>(
      () => WorkOutRepositoryImpl(workOutDataSource: sl()));
  sl.registerLazySingleton<FaceCareRepository>(
      () => FaceCareRespositoryImpl(baseFaceCareDataSource: sl()));
  sl.registerLazySingleton<MealPlanRepository>(
      () => MealPlanRepositoryImpl(mealPlanDataSource: sl()));
  sl.registerLazySingleton<ActivityRepository>(
      () => ActivityRespositoryImpl(activityDataSource: sl()));
  sl.registerLazySingleton<EditProfileRepository>(
      () => EditProfileRespositoryImpl(baseEditProfileDataSource: sl()));
//   sl.registerLazySingleton<ContactSellerRepository>(
//       () => ContactSellerRepositoryImpl(contactSellerDataSource: sl()));
//   sl.registerLazySingleton<ChatListingRepository>(
//       () => ChatListingRepositoryImpl(chatListingDataSource: sl()));
//   sl.registerLazySingleton<TradeCenterRepository>(
//       () => TradeCenterRespositoryImpl(tradeCenterDataSource: sl()));
//   sl.registerLazySingleton<HomeRepository>(
//       () => HomeRepositoryImpl(homeDataSource: sl()));
//   sl.registerLazySingleton<PriceRepository>(
//       () => PriceRepositoryImpl(priceDataSource: sl()));
//   sl.registerLazySingleton<BuyRequestRepository>(
//       () => BuyRequestRepositoryImpl(buyRequestDataSource: sl()));
//   sl.registerLazySingleton<ItemListRepository>(
//       () => ItemListRepositoryImpl(itemListDataSource: sl()));
//   // sl.registerLazySingleton<ContactSellerRepository>(
//   //     () => ContactSellerRepositoryImpl(contactSellerDataSource: sl()));
//   // sl.registerLazySingleton<ContactSellerRepository>(
//   //     () => ContactSellerRepositoryImpl(contactSellerDataSource: sl()));
//   //   //================================================================================ //// //use cases
  sl.registerLazySingleton(() => LoginUseCase(baseLoginRespository: sl()));
  sl.registerLazySingleton(
      () => QuestionStepUseCase(questionStepRespository: sl()));
  sl.registerLazySingleton(
      () => ManifestationUseCase(manifestationRepository: sl()));
  sl.registerLazySingleton(() => WorkOutUseCase(workOutRepository: sl()));
  sl.registerLazySingleton(
      () => FaceCareUseCase(baseFaceCareRespository: sl()));
  sl.registerLazySingleton(() => MealPlanUseCase(mealPlanRepository: sl()));
  sl.registerLazySingleton(() => ActivityUseCase(activityRespository: sl()));
  sl.registerLazySingleton(
      () => EditProfileUseCase(baseEditProfileRespository: sl()));
  // sl.registerLazySingleton(
//       () => ContactSellerUseCase(contactSellerRepository: sl()));
//   sl.registerLazySingleton(
//       () => ChatListingUseCase(chatListingRepository: sl()));
//   sl.registerLazySingleton(
//       () => TradeCenterUseCase(tradeCenterRepository: sl()));
//   sl.registerLazySingleton(() => HomeUseCase(homeRepository: sl()));
//   sl.registerLazySingleton(() => PriceUseCase(priceRepository: sl()));
//   sl.registerLazySingleton(() => BuyRequestUseCase(buyRequestRepository: sl()));
//   sl.registerLazySingleton(() => ItemListUseCase(itemListRepository: sl()));
//   // sl.registerLazySingleton(() => MyJewelryUseCase(myJewelryRepository: sl()));
//
//   //================================================================================ // //blocs
  sl.registerFactory(() => IntroBloc());
  sl.registerFactory(() => QuestionStepBloc(questionStepUseCase: sl()));
  sl.registerFactory(() => HomeBloc());
//   sl.registerFactory(() => SplashBloc(
//       jewelryUseCase: sl(), searchUseCase: sl(), tradeCenterUseCase: sl()));
  sl.registerFactory(() => LoginBloc(loginUseCase: sl()));
  sl.registerFactory(() => EditGoalBloc());
  sl.registerFactory(() => WorkoutPrefrenceBloc());
  sl.registerFactory(() => ManifestationBloc(manifestationUseCase: sl()));
  sl.registerFactory(() => WorkoutBloc(workOutUseCase: sl()));
  sl.registerFactory(() => FaceCareBloc(faceCareUseCase: sl()));
  sl.registerFactory(() => MealPlanBloc(mealPlanUseCase: sl()));
  sl.registerFactory(() => MainHomeBloc(
      faceCareUseCase: sl(),
      manifestationUseCase: sl(),
      mealPlanUseCase: sl(),
      workOutUseCase: sl(),
      editProfileUseCase: sl()));
  sl.registerFactory(
      () => ActivityBloc(mealPlanUseCase: sl(), workOutUseCase: sl()));

  sl.registerFactory(() => EditProfileBloc(editProfileUseCase: sl()));
//   sl.registerFactory(() => RegisterBloc(
//       searchUseCase: sl(), loginUseCase: sl(), uploadDiamondUseCase: sl()));
//   sl.registerFactory(
//       () => BuyRequestBloc(searchUseCase: sl(), buyRequestUseCase: sl()));
//   sl.registerFactory(
//       () => ItemListBloc(chatListingUseCase: sl(), itemListUseCase: sl(), searchUseCase: sl()));
//   sl.registerFactory(() => DiamondLanesPriceBloc(
//         priceUseCase: sl(),
//       ));
//   // sl.registerFactory(() => RegisterBloc(
//   //     searchUseCase: sl(), loginUseCase: sl(), uploadDiamondUseCase: sl()));
//   // sl.registerFactory(() => RegisterBloc(
//   //     searchUseCase: sl(), loginUseCase: sl(), uploadDiamondUseCase: sl()));
//   // sl.registerFactory(() => RegisterBloc(
//   //     searchUseCase: sl(), loginUseCase: sl(), uploadDiamondUseCase: sl()));
//   // sl.registerFactory(() => RegisterBloc(
//   //     searchUseCase: sl(), loginUseCase: sl(), uploadDiamondUseCase: sl()));
//   // sl.registerFactory(() => RegisterBloc(
//   //     searchUseCase: sl(), loginUseCase: sl(), uploadDiamondUseCase: sl()));
//   // sl.registerFactory(() => RegisterBloc(
//   //     searchUseCase: sl(), loginUseCase: sl(), uploadDiamondUseCase: sl()));
//   // sl.registerFactory(() => RegisterBloc(
//   //     searchUseCase: sl(), loginUseCase: sl(), uploadDiamondUseCase: sl()));
//   // sl.registerFactory(() => RegisterBloc(
//   //     searchUseCase: sl(), loginUseCase: sl(), uploadDiamondUseCase: sl()));
//   // sl.registerFactory(() => RegisterBloc(
//   //     searchUseCase: sl(), loginUseCase: sl(), uploadDiamondUseCase: sl()));
// }

//================================================================================ // //blocs
}
