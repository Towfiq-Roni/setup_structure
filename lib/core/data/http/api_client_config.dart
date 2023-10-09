class ApiClientConfig {
  final String baseUrl;
  final String notificationBaseUrl;
  final String googleBaseUrl;
  final String googleApiKey;
  final bool isDebug;

  ApiClientConfig({required this.baseUrl,
      required this.isDebug,
      required this.notificationBaseUrl,
        required this.googleBaseUrl, required this.googleApiKey,});
      

  bool get isNotDebug {
    return !isDebug;
  }
}
