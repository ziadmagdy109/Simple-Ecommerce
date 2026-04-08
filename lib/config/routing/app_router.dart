import 'package:ecommerce/config/routing/app_routes.dart';
import 'package:ecommerce/data/model/accessories.dart';
import 'package:ecommerce/view/details_view.dart';
import 'package:ecommerce/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.homeView,
        builder: (BuildContext context, GoRouterState state) {
          return HomeView();
        },
      ),
      GoRoute(
        path: AppRoutes.detailsView,
        builder: (BuildContext context, GoRouterState state) {
          final accessories = state.extra as Accessories;
          return DetailsView(accessories: accessories);
        },
      ),
    ],
  );
}
