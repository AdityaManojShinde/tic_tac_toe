import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/view/screens/manu_screen.dart';
import 'package:tic_tac_toe/view/screens/pvp_screen.dart';
import 'package:tic_tac_toe/view/screens/settings_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MenuScreen();
      },
    ),
    GoRoute(
      path: '/pvp',
      builder: (BuildContext context, GoRouterState state) {
        return const PvPScreen();
      },
    ),
    GoRoute(
      path: '/settings',
      builder: (BuildContext context, GoRouterState state) {
        return const SettingsScreen();
      },
    ),
  ],
);
