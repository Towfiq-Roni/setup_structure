import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setup_structure/features/splash/presentation/screen/splash_screen.dart';
import 'package:setup_structure/res/app_context_extension.dart';
import '../../routes/app_router.dart';
import '../../routes/navigation_service.dart';

class AppRepositoryProvider extends StatelessWidget {
  const AppRepositoryProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [],
      child: const AppBlocProvider(),
    );
  }
}

class AppBlocProvider extends StatelessWidget {
  const AppBlocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ja')],
        path: 'assets/translations',
        fallbackLocale: const Locale('ja'),
        startLocale: const Locale('ja'),//serviceLocator<AppConfig>().defaultLocale,
        child: Builder(builder: (context) {
          return MaterialApp(
            navigatorKey: NavigationService.navigatorKey,
            onGenerateRoute: AppRouter.generateRoute,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'Hab',
            theme: ThemeData(
              appBarTheme: AppBarTheme(color: context.resources.color.primaryColor),
            ),
            home: SplashScreen(),
          );
        }),
      ),
    );
  }
}
