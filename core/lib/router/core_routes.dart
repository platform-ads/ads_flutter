import 'package:go_router_export/go_router.dart';
import 'package:home/home.dart';
import 'package:login/login.dart';

final GoRouter coreRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/user/auth',
    builder: (context, state) {
      final code = state.uri.queryParameters['code'];
      if (code != null) {
        return AuthPage(code: code); // Passa o código para a página de autenticação
      }
      return const HomePage();
    },
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginPage(),
  ),
]);
