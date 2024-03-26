import 'package:dbz_databook/app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/shared.dart';
import '../../characters.dart';

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({super.key});

  @override
  State<CharactersListPage> createState() => _CharactersListPageState();
}

class _CharactersListPageState extends State<CharactersListPage> {
  final _bloc = sl.get<CharactersBloc>();
  final _characters = <CharacterEntity>[];
  late double _appBarHeight;

  //loadCharacters
  loadCharacters({bool isLoading = true}) {
    _bloc.add(LoadingCharactersEvent(isLoading: isLoading, characterID: null));
  }

  @override
  void initState() {
    super.initState();
    loadCharacters();
    _appBarHeight = AppBar().preferredSize.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'Personagens',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: BlocConsumer<CharactersBloc, CharactersState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is ErrorLoadCharactersState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
          if (state is SuccessLoadCharactersState) {
            _characters.addAll(state.characters);
          }
        },
        builder: (context, state) {
          if (state is LoadingCharactersState) {
            return Column(
              children: [
                Container(
                  height:
                      MediaQuery.of(context).size.height - _appBarHeight - 24,
                  decoration: const BoxDecoration(
                    gradient: CustomThemeData.darkGradient,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Carregando personagens...',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                        SizedBox(
                            height:
                                Responsively.auto(24, MediaQuery.of(context))),
                        const CustomCircularProgressIndicator()
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (state is ErrorLoadCharactersState) {
            return Center(
              child: Text(state.message),
            );
          }
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              gradient: CustomThemeData.orangeGradient,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: ListView.builder(
              itemCount: _characters.length,
              itemBuilder: (context, index) {
                final CharacterEntity character = _characters[index];
                return CharacterCard(
                  character: character,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
