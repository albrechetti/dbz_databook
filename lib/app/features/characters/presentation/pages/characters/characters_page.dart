import 'package:dbz_databook/app/features/characters/domain/domain.dart';
import 'package:dbz_databook/app/features/characters/presentation/blocs/characters/characters_event.dart';
import 'package:dbz_databook/app/features/characters/presentation/blocs/characters/characters_state.dart';
import 'package:dbz_databook/app/features/characters/presentation/widgets/character_card.dart';
import 'package:dbz_databook/app/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  late double _appBarHeight;

  //loadCharacters
  loadCharacters({bool isLoading = true}) {
    _bloc.add(LoadingCharactersEvent(isLoading: isLoading));
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
      backgroundColor: const Color(0xFF192E46),
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'Personagens',
          style: TextStyle(
            color: Color(0xFFF37317),
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF192E46),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        height: 100,
        decoration: const BoxDecoration(
          border: BorderDirectional(
            top: BorderSide(
              color: Color(0xFF2A231C),
              width: 4,
            ),
            end: BorderSide(
              color: Color(0xFF2A231C),
              width: 4,
            ),
            start: BorderSide(
              color: Color(0xFF2A231C),
              width: 4,
            ),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF3D71AC),
              Color(0xFF192E46),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    SvgPicture.asset('assets/back_btn.svg'),
                    const SizedBox(width: 16),
                    const Text('Voltar'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
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
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF192E46),
                        Color(0xFF000000),
                        Color(0xFF000000),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Carregando personagens...',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 24),
                        CustomCircularProgressIndicator()
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
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFF37317),
                  Color(0xFFF37317),
                  Color(0xFFF39E3D),
                ],
              ),
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
