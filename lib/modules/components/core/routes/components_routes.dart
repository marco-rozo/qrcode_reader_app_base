import 'package:code_bar_reader_base/core/routes/app_named_routes.dart';
import 'package:code_bar_reader_base/modules/components/feature/presenter/page/components_page.dart';
import 'package:go_router/go_router.dart';

final class ComponentsRoutes {
  static List<GoRoute> get routes => [
        GoRoute(
          name: AppNamedRoutes.components,
          path: AppNamedRoutes.components,
          builder: (_, __) => const ComponentsPage(),
        )
      ];
}
