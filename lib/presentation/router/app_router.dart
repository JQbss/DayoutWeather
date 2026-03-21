import 'package:dayout_weather/presentation/main_scaffold.dart';
import 'package:dayout_weather/presentation/pages/history/history_page.dart';
import 'package:dayout_weather/presentation/router/app_routes.dart';
import 'package:go_router/go_router.dart';

import '../pages/home/home_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (_, _, navigationShell) => MainScaffold(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [GoRoute(path: AppRoutes.home, builder: (_, _) => HomePage())],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: AppRoutes.history, builder: (_, _) => HistoryPage())],
          ),
        ],
      ),
    ],
  );
}
