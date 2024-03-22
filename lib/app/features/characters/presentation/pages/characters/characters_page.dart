import 'package:dbz_databook/app/features/characters/domain/domain.dart';
import 'package:dbz_databook/app/features/characters/presentation/blocs/characters/characters_event.dart';
import 'package:dbz_databook/app/features/characters/presentation/blocs/characters/characters_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_injections.dart';
import '../../blocs/characters/characters_bloc.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final _bloc = sl.get<CharactersBloc>();

  final _characters = <CharacterEntity>[];

  //loadCharacters
  loadCharacters({bool isLoading = true}) {
    _bloc.add(LoadingCharactersEvent(isLoading: isLoading));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorLoadCharactersState) {
            return const Center(
              child: Text('Error'),
            );
          }
          return ListView.builder(
            itemCount: _characters.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_characters[index].name),
              );
            },
          );
        },
      ),
    );
  }
}
