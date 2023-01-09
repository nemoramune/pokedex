import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/pages/pokemon_detail/pokemon_detail_page.dart';
import 'package:pokedex/pages/pokemon_favorites/pokemon_favorites_page.dart';
import 'package:pokedex/pages/pokemon_list/pokemon_list_page.dart';

part 'routes.g.dart';

@TypedGoRoute<PokemonListRoute>(
  path: '/',
  routes: [TypedGoRoute<PokemonListDetailRoute>(path: 'pokemon/:id')],
)
class PokemonListRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => CustomTransitionPage(
        key: state.pageKey,
        child: const PokemonListPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
}

class PokemonListDetailRoute extends GoRouteData {
  PokemonListDetailRoute({required this.id});
  final int id;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => CustomTransitionPage(
        key: state.pageKey,
        child: PokemonDetailPage(id: id),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
}

@TypedGoRoute<PokemonFavoritesRoute>(
  path: '/favorites',
  routes: [TypedGoRoute<PokemonFavoritesDetailRoute>(path: ':id')],
)
class PokemonFavoritesRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => CustomTransitionPage(
        key: state.pageKey,
        child: const PokemonFavoritesPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
}

class PokemonFavoritesDetailRoute extends GoRouteData {
  PokemonFavoritesDetailRoute({required this.id});
  final int id;
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => CustomTransitionPage(
        key: state.pageKey,
        child: PokemonDetailPage(id: id),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
}
