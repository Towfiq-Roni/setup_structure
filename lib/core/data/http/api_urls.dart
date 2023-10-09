

import '../../../app/app_config.dart';

class ApiUrl {
  static final baseUrl = appConfig.getApiClientConfig().baseUrl;
  static final notificationBaseUrl = appConfig.getApiClientConfig().notificationBaseUrl;
  static final googleUrl = appConfig.getApiClientConfig().googleBaseUrl;
  static final googleApiKey = appConfig.getApiClientConfig().googleApiKey;


  static final refreshToken = '$baseUrl/api/v1/influencer/auth/refresh-token';

  static final pushSubscribe = "$notificationBaseUrl/api/v1/notifications/influencer/subscribe";
  static final pushUnsubscribe = "$notificationBaseUrl/api/v1/notifications/influencer/unsubscribe";
}
