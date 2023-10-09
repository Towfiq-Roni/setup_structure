
import 'package:logger/logger.dart';
import 'package:setup_structure/core/data/cache/base_cache.dart';
import 'package:setup_structure/core/domain/service_locator.dart';
import 'package:setup_structure/routes/navigation_service.dart';

class LogoutService {
  final BaseCache cache;
  // final NotificationService notificationService;

  final Logger logger = serviceLocator<Logger>();

  LogoutService({
    required this.cache,
    // required this.notificationService,
  });

  Future<void> doLogout() async {
    await cache.flushAll();
    await NavigationService.logoutAndNavigateToLoginScreen();
  }

  Future<void> unsubscribeFCM() async {
    // await notificationService.getPushService().unsubscribe();
  }
}
