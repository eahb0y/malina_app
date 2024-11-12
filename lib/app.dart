import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:malina_delivery/core/theme/theme_data.dart';
import 'package:malina_delivery/route/app_routes.dart';
import 'package:malina_delivery/route/name_routes.dart';

import 'generated/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: rootNavigatorKey,
      initialRoute: Routes.initial,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      title: 'Malina',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      // darkTheme: darkTheme,
      // locale: Locale(state.appLocale),
      supportedLocales: AppLocalization.delegate.supportedLocales,
      localizationsDelegates: const [
        AppLocalization.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
