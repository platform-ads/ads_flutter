// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:core/entities/customer.dart';
import 'package:flutter/material.dart';
import 'package:go_router_export/go_router.dart';
import 'package:home/home.dart';
import 'package:landing/landing.dart';

const platname = 'Growth Sphere';

const customer = Customer(
  userId: '123',
  username: 'Joao',
  companyName: 'tradex',
  firstLogin: true,
  companyId: 'asd123',
  role: 'ADMIN',
  access: Access(token: '', refresh: ''),
);

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
    builder: (context, state) => HomePage(
      customer: state.extra as Customer,
    ),
  ),
  GoRoute(
    path: '/user/auth',
    name: 'auth',
    builder: (context, state) {
      final code = state.uri.queryParameters['code'];
      if (code != null) {
        return AuthPage(code: code);
      }
      return HomePage(
        customer: state.extra as Customer,
      );
    },
  ),
], observers: [
  RouteObserver()
]);
