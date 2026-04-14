import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_ecommerce/core/router/app_routes.dart';
import 'package:simple_ecommerce/data/model/product.dart';
import 'package:simple_ecommerce/views/details_view.dart';
import 'package:simple_ecommerce/views/home_view.dart';

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
          final product = state.extra as Product;
          return DetailsView(product: product);
        },
      ),
    ],
  );
}
