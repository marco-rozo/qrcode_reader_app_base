import 'package:code_bar_reader_base/core/routes/app_named_routes.dart';
import 'package:code_bar_reader_base/modules/components/core/routes/components_routes.dart';
import 'package:code_bar_reader_base/modules/home/core/routes/home_routes.dart';
import 'package:code_bar_reader_base/modules/scanner/core/routes/scanner_routes.dart';
import 'package:code_bar_reader_base/modules/splash/core/routes/splash_routes.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final GoRouter routes = GoRouter(
    initialLocation: AppNamedRoutes.splash,
    routes: [
      ...SplashRoutes.routes,
      ...HomeRoutes.routes,
      ...ComponentsRoutes.routes,
      ...ScannerRoutes.routes,
    ],
  );
}
