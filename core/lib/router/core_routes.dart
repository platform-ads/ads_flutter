import 'package:commons/commons.dart';
import 'package:home/home.dart';

final GoRouter coreRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  ),
]);
