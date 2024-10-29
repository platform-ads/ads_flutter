import 'package:go_router_export/go_router.dart';
import 'package:home/home.dart';

final GoRouter coreRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: '/',
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/user/auth',
    name: 'auth',
    builder: (context, state) {
      final code = state.uri.queryParameters['code'];
      if (code != null) {
        return AuthPage(code: code);
      }
      return const HomePage();
    },
  ),
]);
