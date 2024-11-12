import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:malina_delivery/core/theme/colors/app_colors.dart';
import 'package:malina_delivery/route/app_routes.dart';
import 'package:malina_delivery/route/name_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        FlutterNativeSplash.remove();
      },
    );
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        if (context.mounted) {
          Navigator.of(rootNavigatorKey.currentContext!)
              .pushReplacementNamed(Routes.main);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: LightThemeColors.red,
      body: Center(
        child: Image(
          image: AssetImage("assets/png/ic_logo.png"),
        ),
      ),
    );
  }
}
