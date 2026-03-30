import 'package:dayout_weather/core/theme/app_theme.dart';
import 'package:dayout_weather/presentation/router/app_router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: AppTheme.theme,
    );
  }
}
