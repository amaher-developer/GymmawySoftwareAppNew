import 'package:zone/spark/data/data_sources/local_data_source/shared_local_data_source/shared_local_data_source.dart';
import 'package:zone/spark/data/data_sources/remote_data/activites_remote_data_source/activites__remote_data_source_impl.dart';
import 'package:zone/spark/data/data_sources/remote_data/activites_remote_data_source/activites_remote_data_source.dart';
import 'package:zone/spark/data/data_sources/remote_data/attendnce_remote_data_source/attendance_remote_data_source.dart';
import 'package:zone/spark/data/data_sources/remote_data/attendnce_remote_data_source/attendance_remote_data_source_impl.dart';
import 'package:zone/spark/data/data_sources/remote_data/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:zone/spark/data/data_sources/remote_data/available_trainings_remote_data_source/available_trainings_remote_data_source_impl.dart';
import 'package:zone/spark/data/data_sources/remote_data/contact_remote_data_source/contact__remote_data_source_impl.dart';
import 'package:zone/spark/data/data_sources/remote_data/gallery_remote_data_source/gallery_remote_data_source_impl.dart';
import 'package:zone/spark/data/data_sources/remote_data/profile_remote_data_source/profile_remote_data_source.dart';
import 'package:zone/spark/data/data_sources/remote_data/store_remote_data_source/store_remote_data_source.dart';
import 'package:zone/spark/data/data_sources/remote_data/subscription_details_remote_data_source/subscription_details_remote_data_source.dart';
import 'package:zone/spark/data/data_sources/remote_data/subscription_details_remote_data_source/subscription_details_remote_data_source_impl.dart';
import 'package:zone/spark/data/data_sources/remote_data/track_details_remote_data_source/track_details_remote_data_source.dart';
import 'package:zone/spark/data/data_sources/remote_data/training_plan_remote_data_source/training_plan_remote_data_source.dart';
import 'package:zone/spark/data/data_sources/remote_data/training_plan_remote_data_source/training_plan_remote_data_source_impl.dart';
import 'package:zone/spark/data/data_sources/remote_data/training_sessions_remote_data_source/training_sessions_remote_data_source.dart';
import 'package:zone/spark/data/repositories/activityies_repository_impl.dart';
import 'package:zone/spark/data/repositories/available_trainings_repository_impl.dart';
import 'package:zone/spark/data/repositories/contact_repository_impl.dart';
import 'package:zone/spark/data/repositories/gallery_repository_impl.dart';
import 'package:zone/spark/data/repositories/home_repository_impl.dart';
import 'package:zone/spark/data/repositories/profile_repository_impl.dart';
import 'package:zone/spark/data/repositories/store_repository_impl.dart';
import 'package:zone/spark/data/repositories/subscription_repository_impl.dart';
import 'package:zone/spark/data/repositories/training_plan_repository_impl.dart';
import 'package:zone/spark/data/repositories/user_reposistory_impl.dart';
import 'package:zone/spark/domain/repositories/activity_repoistory.dart';
import 'package:zone/spark/domain/repositories/attendance_repository.dart';
import 'package:zone/spark/domain/repositories/available_trainings_repoistory.dart';
import 'package:zone/spark/domain/repositories/banner_repoistory.dart';
import 'package:zone/spark/domain/repositories/gallery_repository.dart';
import 'package:zone/spark/domain/repositories/home_repository.dart';
import 'package:zone/spark/domain/repositories/profile_repoistory.dart';
import 'package:zone/spark/domain/repositories/shared_repoistory.dart';
import 'package:zone/spark/domain/repositories/track_details_repository.dart';
import 'package:zone/spark/domain/repositories/tracks_repository.dart';
import 'package:zone/spark/domain/repositories/training_plan_repository.dart';
import 'package:zone/spark/domain/repositories/training_sessions_repository.dart';
import 'package:zone/spark/domain/repositories/user_repository.dart';
import 'package:zone/spark/domain/usecases/activites_use_case/get_all_activies_use_case.dart';
import 'package:zone/spark/domain/usecases/activites_use_case/reserve_activity_use_case.dart';
import 'package:zone/spark/domain/usecases/attendences_usecase/attendancest_usecase.dart';
import 'package:zone/spark/domain/usecases/auth_usecase/login_use_case.dart';
import 'package:zone/spark/domain/usecases/auth_usecase/splash_usecase.dart';
import 'package:zone/spark/domain/usecases/available_trainings_usecase/get_training_details_use_case.dart';
import 'package:zone/spark/domain/usecases/available_trainings_usecase/training_reservation_use_case.dart';
import 'package:zone/spark/domain/usecases/banners_use_case/get_all_banners_use_case.dart';
import 'package:zone/spark/domain/usecases/banners_use_case/get_banner_details_use_case.dart';
import 'package:zone/spark/domain/usecases/contact_use_case.dart';
import 'package:zone/spark/domain/usecases/gallery_usecase/gallery_usecase.dart';
import 'package:zone/spark/domain/usecases/profile_use_case/get_profile_data_use_case.dart';
import 'package:zone/spark/domain/usecases/store_usecase/get_store_details_use_case.dart';
import 'package:zone/spark/domain/usecases/subscriptions_usecase/subscription_details_usecase.dart';
import 'package:zone/spark/domain/usecases/subscriptions_usecase/subscription_usecase.dart';
import 'package:zone/spark/domain/usecases/track_details_usecase/trak_details_usecase.dart';
import 'package:zone/spark/domain/usecases/tracks_usecase/traks_usecase.dart';
import 'package:zone/spark/domain/usecases/training_plan_usecase/training_plan_usecase.dart';
import 'package:zone/spark/domain/usecases/training_plan_usecase/training_plans_use_case.dart';
import 'package:zone/spark/domain/usecases/training_sessions_usecase/training_sessions_usecase.dart';
import 'package:zone/spark/presentation/cubit/activites/all_activites/activities_cubit.dart';
import 'package:zone/spark/presentation/cubit/available_trainings/available_trainings_cubit.dart';
import 'package:zone/spark/presentation/cubit/available_trainings/training_reserivation/training_reservation_cubit.dart';
import 'package:zone/spark/presentation/cubit/banners/all_banners/banners_cubit.dart';
import 'package:zone/spark/presentation/cubit/banners/banner_details/banner_details_cubit.dart';
import 'package:zone/spark/presentation/cubit/contact/contact_cubit.dart';
import 'package:zone/spark/presentation/cubit/login/login_cubit.dart';
import 'package:zone/spark/presentation/cubit/main_layout/cubit.dart';
import 'package:zone/spark/presentation/cubit/notification/notification_cubit.dart';
import 'package:zone/spark/presentation/cubit/profile/profile_cubit.dart';
import 'package:zone/spark/presentation/cubit/shared/shared_cubit.dart';
import 'package:zone/spark/presentation/cubit/splash/splash_cuibt.dart';
import 'package:zone/spark/presentation/cubit/store/store_cubit.dart';
import 'package:zone/spark/presentation/cubit/store/store_deatails/store_details_cubit.dart';
import 'package:zone/spark/presentation/cubit/subscription_details/subscription_details_cubit.dart';
import 'package:zone/spark/presentation/cubit/tracks/tracks_cubit.dart';
import 'package:zone/spark/presentation/cubit/trining_session/training_sessions_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../spark/data/data_sources/local_data_source/shared_local_data_source/shared_local_data_source_impl.dart';
import '../../spark/data/data_sources/remote_data/auth_remote_data_source/auth__remote_data_source_impl.dart';
import '../../spark/data/data_sources/remote_data/available_trainings_remote_data_source/available_trainings_remote_data_source.dart';
import '../../spark/data/data_sources/remote_data/banners_remote_data_source/banners_remote_data_source.dart';
import '../../spark/data/data_sources/remote_data/banners_remote_data_source/banners_remote_data_source_impl.dart';
import '../../spark/data/data_sources/remote_data/contact_remote_data_source/contact_remote_data_source.dart';
import '../../spark/data/data_sources/remote_data/gallery_remote_data_source/gallery_remote_data_source.dart';
import '../../spark/data/data_sources/remote_data/home_remote_data_source/home_remote_data_source.dart';
import '../../spark/data/data_sources/remote_data/home_remote_data_source/home_remote_data_source_impl.dart';
import '../../spark/data/data_sources/remote_data/profile_remote_data_source/profile__remote_data_source_impl.dart';
import '../../spark/data/data_sources/remote_data/store_remote_data_source/store_remote_data_source_impl.dart';
import '../../spark/data/data_sources/remote_data/subscription_remote_data_source/subscription_remote_data_source.dart';
import '../../spark/data/data_sources/remote_data/subscription_remote_data_source/subscription_remote_data_source_impl.dart';
import '../../spark/data/data_sources/remote_data/track_details_remote_data_source/track_details_remote_data_source_impl.dart';
import '../../spark/data/data_sources/remote_data/tracks_remote_data_source/traks_remote_data_source.dart';
import '../../spark/data/data_sources/remote_data/tracks_remote_data_source/traks_remote_data_source_impl.dart';
import '../../spark/data/data_sources/remote_data/training_sessions_remote_data_source/training_sessions_remote_data_source_impl.dart';
import '../../spark/data/repositories/attendance_repository_impl.dart';
import '../../spark/data/repositories/banners_repository_impl.dart';
import '../../spark/data/repositories/shared_reposistory_impl.dart';
import '../../spark/data/repositories/subscription_details_repository_impl.dart';
import '../../spark/data/repositories/track_details_repository_impl.dart';
import '../../spark/data/repositories/tracks_repository_impl.dart';
import '../../spark/data/repositories/training_sessions_repository_impl.dart';
import '../../spark/domain/repositories/contact_repoistory.dart';
import '../../spark/domain/repositories/store_repository.dart';
import '../../spark/domain/repositories/subscription_details_repository.dart';
import '../../spark/domain/repositories/subscriptions_repository.dart';
import '../../spark/domain/usecases/activites_use_case/get_activity_details_use_case.dart';
import '../../spark/domain/usecases/available_trainings_usecase/available_trainings_usecase.dart';
import '../../spark/domain/usecases/home_usecase.dart';
import '../../spark/domain/usecases/shared_use_case.dart';
import '../../spark/domain/usecases/store_usecase/store_usecase.dart';
import '../../spark/presentation/cubit/activites/avtivity_deatails/activity_details_cubit.dart';
import '../../spark/presentation/cubit/attendances/attendances_cubit.dart';
import '../../spark/presentation/cubit/available_trainings/training_details/training_details_cubit.dart';
import '../../spark/presentation/cubit/gallery/gallery_cubit.dart';
import '../../spark/presentation/cubit/home/home_cubit.dart';
import '../../spark/presentation/cubit/subscriptions/subscriptions_cubit.dart';
import '../../spark/presentation/cubit/track_details/track_details_cubit.dart';
import '../../spark/presentation/cubit/training_plan/training_plan_cubit.dart';
import '../../spark/presentation/cubit/training_plans/training_plans_cubit.dart';
import '../network/api_constants.dart';

final sl = GetIt.instance;

Future<void> initServices() async {
  // cubits

  sl.registerFactory<HomeCubit>(
    () => HomeCubit(
      repository: sl.call(),
    ),
  );
  sl.registerFactory<TracksCubit>(
    () => TracksCubit(
      tracksUseCase: sl.call(),
    ),
  );
  sl.registerFactory<SharedCubit>(
    () => SharedCubit(
      sharedRepository: sl.call(),
    ),
  );
  sl.registerFactory<AttendancesCubit>(
    () => AttendancesCubit(
      attendancesUseCase: sl.call(),
    ),
  );
  sl.registerFactory<TrackDetailsCubit>(
    () => TrackDetailsCubit(
      trackDetailsUseCase: sl.call(),
    ),
  );
  sl.registerFactory<StoreCubit>(
    () => StoreCubit(
      storeUseCase: sl.call(),
    ),
  );
  sl.registerFactory<AvailableTrainingsCubit>(
    () => AvailableTrainingsCubit(
      availableTrainingsUseCase: sl.call(),
    ),
  );
  // TODO: Change repository to usecase in NotificationCubit
  sl.registerFactory<NotificationCubit>(
    () => NotificationCubit(
      repository: sl.call(),
    ),
  );
  sl.registerFactory<SubscriptionDetailsCubit>(
    () => SubscriptionDetailsCubit(
      subscriptionDetailsUseCase: sl.call(),
    ),
  );
  sl.registerFactory<MainLayoutCubit>(
    () => MainLayoutCubit(),
  );
  sl.registerFactory<LoginCubit>(
    () => LoginCubit(loginUseCase: sl.call()),
  );
  sl.registerFactory<SubscriptionsCubit>(
    () => SubscriptionsCubit(subscriptionsUseCase: sl.call()),
  );
  sl.registerFactory<SplashCubit>(
    () => SplashCubit(splashUseCase: sl.call()),
  );
  sl.registerFactory<GalleryCubit>(
    () => GalleryCubit(galleryImagesUseCase: sl.call()),
  );
  sl.registerFactory<ActivitiesCubit>(
    () => ActivitiesCubit(
      getAllActivitiesUseCase: sl.call(),
    ),
  );
  sl.registerFactory<ActivityDetailsCubit>(
    () => ActivityDetailsCubit(
      getActivityDetailsUseCase: sl.call(),
      reserveActivityUseCase: sl.call(),
    ),
  );
  sl.registerFactory<ContactCubit>(
    () => ContactCubit(
      contactUseCase: sl.call(),
    ),
  );
  sl.registerFactory<BannersCubit>(
    () => BannersCubit(
      getAllBannersUseCase: sl.call(),
    ),
  );
  sl.registerFactory<BannerDetailsCubit>(
    () => BannerDetailsCubit(
      getBannerDetailsUseCase: sl.call(),
    ),
  );
  sl.registerFactory<ProfileCubit>(
    () => ProfileCubit(
      getProfileDataUseCase: sl.call(),
    ),
  );
  sl.registerFactory<StoreDetailsCubit>(
    () => StoreDetailsCubit(
      getStoreDetailsUseCase: sl.call(),
    ),
  );
  sl.registerFactory<TrainingDetailsCubit>(
    () => TrainingDetailsCubit(
      getTrainingDetailsUseCase: sl.call(),
    ),
  );
  sl.registerFactory<TrainingPlanCubit>(
    () => TrainingPlanCubit(
      getTrainingPlanUseCase: sl.call(),
    ),
  );
  sl.registerFactory<TrainingPlansCubit>(
    () => TrainingPlansCubit(
      getTrainingPlansUseCase: sl.call(),
    ),
  );
  sl.registerFactory<TrainingSessionsCubit>(
    () => TrainingSessionsCubit(
      trainingSessionsUseCase: sl.call(),
    ),
  );
  sl.registerFactory<TrainingReservationCubit>(
    () => TrainingReservationCubit(
      trainingReservationUseCase: sl.call(),
    ),
  );

  // use cases

  sl.registerLazySingleton<GetAllHomeDataUseCase>(
    () => GetAllHomeDataUseCase(
      homeRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<ReserveActivityUseCase>(
    () => ReserveActivityUseCase(
      sl.call(),
    ),
  );
  sl.registerLazySingleton<SharedUseCase>(
    () => SharedUseCase(
      sharedRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<TrackDetailsUseCase>(
    () => TrackDetailsUseCase(
      trackDetailsRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<AttendancesUseCase>(
    () => AttendancesUseCase(
      attendanceRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<TracksUseCase>(
    () => TracksUseCase(
      tracksRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<AvailableTrainingsUseCase>(
    () => AvailableTrainingsUseCase(
      availableTrainingsRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<StoreUseCase>(
    () => StoreUseCase(
      storeRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<GetSubscriptionDetailsUseCase>(
    () => GetSubscriptionDetailsUseCase(
      subscriptionsRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      userRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<GalleryImagesUseCase>(
    () => GalleryImagesUseCase(
      galleryRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<SplashUseCase>(
    () => SplashUseCase(
      userRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<GetSubscriptionsUseCase>(
    () => GetSubscriptionsUseCase(
      subscriptionsRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<GetAllActivitiesUseCase>(
    () => GetAllActivitiesUseCase(
      activitiesRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<GetActivityDetailsUseCase>(
    () => GetActivityDetailsUseCase(
      activitiesRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<ContactUseCase>(
    () => ContactUseCase(
      contactRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<GetAllBannersUseCase>(
    () => GetAllBannersUseCase(
      bannersRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<GetBannerDetailsUseCase>(
    () => GetBannerDetailsUseCase(
      bannersRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<GetProfileDataUseCase>(
    () => GetProfileDataUseCase(
      profileRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<GetStoreDetailsUseCase>(
    () => GetStoreDetailsUseCase(
      storeRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<GetTrainingDetailsUseCase>(
    () => GetTrainingDetailsUseCase(
      availableTrainingsRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<GetTrainingPlanUseCase>(
    () => GetTrainingPlanUseCase(
      trainingPlanRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<GetTrainingPlansUseCase>(
    () => GetTrainingPlansUseCase(
      trainingPlanRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<TrainingSessionsUseCase>(
    () => TrainingSessionsUseCase(
      trainingSessionsRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<TrainingReservationUseCase>(
    () => TrainingReservationUseCase(
      availableTrainingsRepository: sl.call(),
    ),
  );

  // repositories
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      homeDataSource: sl.call(),
    ),
  );
  sl.registerLazySingleton<TracksRepository>(
    () => TracksRepositoryImpl(
      tracksRemoteDataSource: sl.call(),
    ),
  );
  sl.registerLazySingleton<SharedRepository>(
    () => SharedRepositoryImpl(
      sharedLocalDataSource: sl.call(),
    ),
  );
  sl.registerLazySingleton<AttendanceRepository>(
    () => AttendanceRepositoryImpl(
      attendanceRemoteDataSource: sl.call(),
    ),
  );
  sl.registerLazySingleton<TrackDetailsRepository>(
    () => TrackDetailsRepositoryImpl(
      trackDetailsRemoteDataSource: sl.call(),
    ),
  );
  sl.registerLazySingleton<StoreRepository>(
    () => StoreRepositoryImpl(
      storeRemoteDataSource: sl.call(),
    ),
  );
  sl.registerLazySingleton<AvailableTrainingsRepository>(
    () => AvailableTrainingsRepositoryImpl(
      availableTrainingsRemoteDataSource: sl.call(),
    ),
  );
  sl.registerLazySingleton<SubscriptionDetailsRepository>(
    () => SubscriptionDetailsRepositoryImpl(
      subscriptionsRemoteDataSource: sl.call(),
    ),
  );
  sl.registerLazySingleton<SubscriptionsRepository>(
    () => SubscriptionsRepositoryImpl(
      subscriptionsRemoteDataSource: sl.call(),
    ),
  );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      authRemoteDataSource: sl.call(),
    ),
  );

  sl.registerLazySingleton<GalleryRepository>(
    () => GalleryRepositoryImpl(
      galleryRemoteDataSource: sl.call(),
    ),
  );

  sl.registerLazySingleton<ActivitiesRepository>(
    () => ActivitiesRepositoryImpl(
      activitiesRemoteDataSource: sl.call(),
    ),
  );

  sl.registerLazySingleton<ContactRepository>(
    () => ContactRepositoryImpl(
      contactRemoteDataSource: sl.call(),
    ),
  );

  sl.registerLazySingleton<BannersRepository>(
    () => BannersRepositoryImpl(
      bannersRemoteDataSource: sl.call(),
    ),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      profileRemoteDataSource: sl.call(),
    ),
  );
  sl.registerLazySingleton<TrainingPlanRepository>(
    () => TrainingPlanRepositoryImpl(
      trainingPlanRemoteDataSource: sl.call(),
    ),
  );
  sl.registerLazySingleton<TrainingSessionsRepository>(
    () => TrainingSessionsRepositoryImpl(
      trainingSessionRemoteDataSource: sl.call(),
    ),
  );

  // data sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(
      dio: sl.call(),
    ),
  );
  sl.registerLazySingleton<SharedLocalDataSource>(
    () => SharedLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<TracksRemoteDataSource>(
    () => TracksRemoteDataSourceImpl(
      dio: sl.call(),
    ),
  );
  sl.registerLazySingleton<AttendanceRemoteDataSource>(
    () => AttendanceRemoteDataSourceImpl(
      dio: sl.call(),
    ),
  );
  sl.registerLazySingleton<TrackDetailsRemoteDataSource>(
    () => TrackDetailsRemoteDataSourceImpl(
      dio: sl.call(),
    ),
  );
  sl.registerLazySingleton<StoreRemoteDataSource>(
    () => StoreRemoteDataSourceImpl(
      dio: sl.call(),
    ),
  );
  sl.registerLazySingleton<AvailableTrainingsRemoteDataSource>(
    () => AvailableTrainingsRemoteDataSourceImpl(
      dio: sl.call(),
    ),
  );
  sl.registerLazySingleton<SubscriptionsRemoteDataSource>(
    () => SubscriptionRemoteDataSourceImpl(
      dio: sl.call(),
    ),
  );
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      dio: sl.call(),
    ),
  );
  sl.registerLazySingleton<SubscriptionDetailsRemoteDataSource>(
    () => SubscriptionDetailsRemoteDataSourceImpl(
      dio: sl.call(),
    ),
  );
  sl.registerLazySingleton<GalleryRemoteDataSource>(
    () => GalleryRemoteDataSourceImpl(
      dio: sl.call(),
    ),
  );
  sl.registerLazySingleton<ActivitiesRemoteDataSource>(
    () => ActivitiesRemoteDataSourceImpl(
      dio: sl.call(),
    ),
  );

  sl.registerLazySingleton<ContactRemoteDataSource>(
    () => ContactRemoteDataSourceImpl(
      dio: sl.call(),
    ),
  );
  sl.registerLazySingleton<BannersRemoteDataSource>(
    () => BannersRemoteDataSourceImpl(
      dio: sl.call(),
    ),
  );
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(
      dio: sl.call(),
    ),
  );
  sl.registerLazySingleton<TrainingPlanRemoteDataSource>(
    () => TrainingPlanRemoteDataSourceImpl(
      dio: sl.call(),
    ),
  );
  sl.registerLazySingleton<TrainingSessionRemoteDataSource>(
    () => TrainingSessionRemoteDataSourceImpl(
      dio: sl.call(),
    ),
  );

  // external
  sl.registerLazySingleton(
    () => _DioService.init(),
  );
  final sharedPreferences = await _SharedPreferencesService.init();
  sl.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );
}

class _DioService {
  static Dio init() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
/*        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${UserHelper.getUserToken()}',

          //authroization
        },*/
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        receiveDataWhenStatusError: true,
        validateStatus: (status) {
          return true;
        },
      ),
    );
    _addDioLogger(dio);

    return dio;
  }

  static void _addDioLogger(Dio dio) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }
}

class _SharedPreferencesService {
  static Future<SharedPreferences> init() async {
    return SharedPreferences.getInstance();
  }
}
