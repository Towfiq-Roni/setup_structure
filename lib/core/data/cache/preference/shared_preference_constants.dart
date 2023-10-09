

import 'package:setup_structure/core/data/dto/pagination.dart';

class SharedPreferenceConstant {
  static const String jwt = 'jwt';
  static const String email = 'email';
  static const String refreshToken = 'refresh_token';
  static const String accessToken = 'access_token';
  // static const String login = 'login';
  static const String recentSearch = 'recentSearch';
  static const String profile = 'profile';
  static const String progress = 'progress';
  static const String recommendations = 'recommendations';
  static const String reviews = 'reviews';
  static const String noticeList = 'noticeList';
  static const String details = 'details';
  static RegExp doneListPattern = RegExp('^doneList-');
  static String doneList(PaginationRequest request) => 'doneList-${request.page}-${request.size}';
  static const String allNotifications = 'allNotifications';
  static const String notificationSettings = 'notificationSettings';
  static const String terms = 'terms';
  static const String policy = 'policy';
  static const String landingTutorial = 'landingTutorial';
  static const String savedListTutorial = 'savedListTutorial';
  static const String genre = 'genre';
  static const String version = 'version';
}
