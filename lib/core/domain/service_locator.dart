import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:setup_structure/core/domain/request.dart';
import 'package:setup_structure/features/auth/data/datasource/login_remote_datasource.dart';
import 'package:setup_structure/features/auth/data/repository/login_user_repository.dart';
import 'package:setup_structure/features/auth/domain/repository/authentication_user_repository.dart';
import 'package:setup_structure/features/auth/domain/usecases/authentication_usecase.dart';

import '../../app/app_config.dart';
import '../../services/user_cache_service.dart';
import '../data/cache/base_cache.dart';
import '../data/cache/preference_cache.dart';
import '../data/http/api_client.dart';
import '../data/http/api_client_config.dart';

final serviceLocator = GetIt.instance;

Future<void> setUpServiceLocator(AppConfig appConfig
    // , NotificationService notificationService
    ) async {
  serviceLocator.registerSingleton<AppConfig>(appConfig);

  //check if user logged in or not
  // serviceLocator.registerFactory<CheckUserLoginStatus>(
  //   () => CheckUserLoginStatusImpl(),
  // );
  //usecase
  serviceLocator.registerFactory<LoginUserUsecase>(() => LoginUserUsecase());

  //datasource
  serviceLocator.registerFactory<LoginRemoteDataSource>(() => LoginRemoteDataSourceImpl());

  //repositories
  serviceLocator.registerFactory<LoginUserRepository>(() => LoginUserRepositoryImpl());

  serviceLocator.registerSingleton<UserCacheService>(UserCacheService());
  //external
  /*final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerFactory<SharedPreferences>(() => sharedPreferences);*/
  // request
  serviceLocator.registerSingleton<Request>(Request());

  serviceLocator.registerFactory<ApiClient>(
      () => ApiClient(serviceLocator<ApiClientConfig>(), serviceLocator<BaseCache>(), Logger()));
  serviceLocator.registerFactory<BaseCache>(() => PreferenceCache());

  serviceLocator.registerFactory<ApiClientConfig>(() => ApiClientConfig(
        baseUrl: appConfig.apiBaseUrl,
        isDebug: appConfig.debug,
        googleBaseUrl: appConfig.googleBaseUrl,
        googleApiKey: appConfig.googleApiKey,
        notificationBaseUrl: appConfig.notificationBaseUrl,
      ));

  /// end campaign status change

  serviceLocator.registerSingleton<Logger>(Logger());

  // serviceLocator.registerSingleton<NotificationService>(notificationService);

  // serviceLocator.registerSingleton<LogoutService>(
  //   LogoutService(
  //     cache: serviceLocator<BaseCache>(),
  //     notificationService: serviceLocator<NotificationService>(),
  //   ),
  // );
}
