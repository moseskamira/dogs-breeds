import 'package:dogs/presentation/pages/breed_images_page.dart';
import 'package:dogs/presentation/pages/fav_page.dart';
import 'package:dogs/presentation/pages/home_page.dart';
import 'package:dogs/router/route_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  initialLocation: RoutePath.homePage,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: RoutePath.homePage,
      builder: (context, state) => const MyHomePage(title: 'Dog Breeds'),
    ),
    GoRoute(
      name: 'images',
      path: RoutePath.imagesPage,
      builder: (context, state) {
        final stateExtras = state.extra;
        final name = stateExtras as String;
        return BreedImagesPage(breedName: name);
      },
    ),
    GoRoute(
      name: "favourites",
      path: RoutePath.favPage,
      builder: (context, state) => const FavPage(),
    ),
  ],
);
