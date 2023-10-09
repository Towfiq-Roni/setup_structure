
import 'package:setup_structure/core/data/http/api_client.dart';
import 'package:setup_structure/core/data/http/api_urls.dart';
import 'package:setup_structure/features/notification/domain/notification_repository.dart';

class NotificationHttpRepository extends NotificationRepository {
  late ApiClient _client;

  NotificationHttpRepository(client) {
    _client = client;
  }

  @override
  Future<String?> subscribe(String deviceToken) async {
    try {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['fcmToken'] = deviceToken;
      final response = await _client.authorizedPost(ApiUrl.pushSubscribe, data);
      return response.message;
    } catch (e) {
      throw Future.error(e);
    }
  }

  @override
  Future<String?> unsubscribe(String deviceToken) async {
    try {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['fcmToken'] = deviceToken;
      final response = await _client.authorizedPost(ApiUrl.pushUnsubscribe, data);
      return response.message;
    } catch (e) {
      throw Future.error(e);
    }
  }
}
