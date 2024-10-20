import 'package:commons/commons.dart';
import 'package:home/home.dart';
import 'package:login/login.dart';

final GoRouter coreRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
  ],
);
