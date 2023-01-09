import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex/features/pokemon/components/pokemon_list_view.dart';
import 'package:pokedex/features/pokemon/pokemon_list_view_model.dart';
import 'package:pokedex/hooks/use_strings.dart';

class PokemonListPage extends HookConsumerWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = useStrings();
    final viewModel = ref.watch(pokemonListViewModelProvider.notifier);
    final state = ref.watch(pokemonListViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: Text(strings.appName)),
      body: PokemonListView(
        list: state.valueOrNull?.list,
        isLast: state.valueOrNull?.isLoadedToLast,
        error: state.error,
        loadMore: viewModel.fetch,
        onPressedFavorite: viewModel.favorite,
        refresh: viewModel.refresh,
      ),
    );
  }
}
