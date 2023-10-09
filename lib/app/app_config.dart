import 'package:flutter/material.dart';

import '../core/data/http/api_client_config.dart';

class AppConfig {
  static const String _prodEnvName = "production";
  static const String _devEnvName = "development";

  late final String apiBaseUrl;
  late final String notificationBaseUrl;
  late final String googleBaseUrl;
  late final String googleApiKey;
  final String environment = _prodEnvName;
  late final bool debug;
  late final Locale defaultLocale;

  static final _appConfig = AppConfig._internal();

  AppConfig._internal();

  bool isProduction() {
    return environment == _prodEnvName;
  }

  bool isDevelopment() {
    return environment == _devEnvName;
  }

  bool isDebug() {
    return debug;
  }

  bool isNotDebug() {
    return !debug;
  }

  ApiClientConfig getApiClientConfig() {
    return ApiClientConfig(
      baseUrl: apiBaseUrl,
      notificationBaseUrl: notificationBaseUrl,
      googleBaseUrl: googleBaseUrl,
      googleApiKey: googleApiKey,
      isDebug: debug,
    );
  }

  factory AppConfig() {
    return _appConfig;
  }

  loadData(Map<String, dynamic> map) {
    apiBaseUrl = map['API_BASE_URL'];
    notificationBaseUrl = map['NOTIFICATION_BASE_URL'];
    googleBaseUrl = map['GOOGLE_BASE_URL'];
    googleApiKey = map['GOOGLE_API_KEY'];
    debug = map['DEBUG'] == 'true';
    defaultLocale = Locale(map['DEFAULT_LOCALE'] ?? 'en');
  }
}

final AppConfig appConfig = AppConfig();
