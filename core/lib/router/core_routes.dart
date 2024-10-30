// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:go_router_export/go_router.dart';
import 'package:home/home.dart';
import 'package:landing/landing.dart';

const platname = 'Growth Sphere';

final GoRouter coreRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: '/',
    builder: (context, state) {
      html.document.title = '$platname - Início';
      return const LandingPage();
    },
  ),
  GoRoute(
    path: '/home',
    name: '/home',
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
], observers: [
  RouteObserver()
]);
