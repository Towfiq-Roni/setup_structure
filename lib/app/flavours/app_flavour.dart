import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:setup_structure/services/version/version.dart';

import '../../core/domain/service_locator.dart';
import '../app_config.dart';

// Future<NotificationService> _bootNotificationServices() async {
//   var notificationService = NotificationService();
//   await notificationService.init();
//   return notificationService;
// }

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await dotenv.load();
  appConfig.loadData(dotenv.env);
  // var notificationService = await _bootNotificationServices();
  await setUpServiceLocator(appConfig
      // , notificationService
  );
  await getVersion();

  await runZonedGuarded(
    () async {
      runApp(await builder());
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
