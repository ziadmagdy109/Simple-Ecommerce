import 'package:ecommerce/config/routing/app_routes.dart';
import 'package:ecommerce/data/model/accessories.dart';
import 'package:ecommerce/data/repository/get_all_accessories_repository.dart';
import 'package:ecommerce/data/service/get_all_accessories_web_service.dart';
import 'package:ecommerce/logic/cubit/accessories_cubit.dart';
import 'package:ecommerce/view/details_view.dart';
import 'package:ecommerce/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static late GetAllAccessoriesRepository getAllAccessoriesRepository;
  static late AccessoriesCubit accessoriesCubit;
  AppRouter() {
    getAllAccessoriesRepository = GetAllAccessoriesRepository(
      getAllProductWebService: GetAllAccessoriesWebService(),
    );
    accessoriesCubit = AccessoriesCubit(
      getAllProductRepository: getAllAccessoriesRepository,
    );
  }
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.homeView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (BuildContext context) => accessoriesCubit,
            child: const HomeView(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.detailsView,
        builder: (BuildContext context, GoRouterState state) {
          final accessories = state.extra as Accessories;
          return BlocProvider(
            create: (BuildContext context) => accessoriesCubit,
            child: DetailsView(accessories: accessories),
          );
        },
      ),
    ],
  );
}
