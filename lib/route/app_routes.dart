import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_delivery/features/basket/presentation/page/eat_basket/eat_basket_page.dart';
import 'package:malina_delivery/features/basket/presentation/page/stuff_basket/stuff_basket_page.dart';
import 'package:malina_delivery/features/favourite/presentation/page/favourite_page.dart';
import 'package:malina_delivery/features/home/presentation/page/home_page.dart';
import 'package:malina_delivery/features/main/presentation/page/main_page.dart';
import 'package:malina_delivery/features/profile/presentation/page/profile_page.dart';
import 'package:malina_delivery/features/qr_code/presentation/bloc/qr_code_bloc.dart';
import 'package:malina_delivery/features/qr_code/presentation/page/qr_scan_page.dart';
import 'package:malina_delivery/features/splash/presentation/page/splash_page.dart';
import 'package:malina_delivery/injector_container.dart';
import 'package:malina_delivery/route/name_routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellRootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print("route : ${settings.name}");
    }
    switch (settings.name) {
      case Routes.initial:
        return buildPageWithDefaultTransition(child: const SplashPage());
      case Routes.main:
        if (settings.arguments != null) {
          return buildPageWithNoTransition(
            child: MainPage(
              initialRoute: settings.arguments as String,
            ),
          );
        }
        return buildPageWithNoTransition(child: const MainPage());
      case Routes.qrScan:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<QrCodeBloc>(
                  create: (context) => sl<QrCodeBloc>(),
                  child: const QrScanPage(),
                ));
      default:
        return buildPageWithDefaultTransition(child: const HomePage());
    }
  }

  static Route<dynamic> onShellGenerateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print("route shell :  ${settings.name}");
    }
    switch (settings.name) {
      case Routes.initial:
        return buildPageWithDefaultTransition(child: HomePage());
      case Routes.favourite:
        return buildPageWithDefaultTransition(child: const FavouritePage());
      case Routes.profile:
        return buildPageWithDefaultTransition(child: const ProfilePage());
      case Routes.basketEat:
        return buildPageWithDefaultTransition(child: const EatBasketPage());
      case Routes.basketStuff:
        return buildPageWithDefaultTransition(child: const StuffBasketPage());
      default:
        return buildPageWithDefaultTransition(child: const HomePage());
    }
  }
}

PageRouteBuilder buildPageWithDefaultTransition<T>({required Widget child}) {
  return PageRouteBuilder<T>(
    pageBuilder: (_, __, ___) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

PageRouteBuilder buildPageWithNoTransition<T>({required Widget child}) {
  return PageRouteBuilder<T>(
    reverseTransitionDuration: Duration.zero,
    transitionDuration: Duration.zero,
    pageBuilder: (_, __, ___) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
