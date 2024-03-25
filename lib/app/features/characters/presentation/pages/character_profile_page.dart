import 'package:carousel_slider/carousel_slider.dart';
import 'package:dbz_databook/app/features/characters/characters.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/core.dart';
import '../../../../shared/shared.dart';

class CharacterProfilePage extends StatefulWidget {
  final CharacterEntity character;
  const CharacterProfilePage({super.key, required this.character});

  @override
  State<CharacterProfilePage> createState() => _CharacterProfilePageState();
}

class _CharacterProfilePageState extends State<CharacterProfilePage> {
  final _bloc = sl.get<CharacterTransformationsBloc>();
  final _carouselController = CarouselController();
  final List<TransformationEntity> _transformations = [];
  int _initialIndex = 0;

  //loadTransformations
  loadTransformations({bool isLoading = true}) {
    _bloc.add(LoadingCharacterTransformationsEvent(
      isLoading: isLoading,
      characterID: widget.character.id.toString(),
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadTransformations();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharacterTransformationsBloc,
        CharacterTransformationsState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is ErrorLoadCharacterTransformationsState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
        if (state is SuccessLoadCharacterTransformationsState) {
          _transformations.addAll(state.characterTransformations);
        }
      },
      builder: (context, state) {
        if (state is LoadingCharacterTransformationsState) {
          return const Scaffold(
            backgroundColor: Color(0xFF192E46),
            body: Center(child: CustomCircularProgressIndicator()),
          );
        } else if (state is ErrorLoadCharacterTransformationsState) {
          return Center(
            child: Text(state.message),
          );
        }
        return Scaffold(
          backgroundColor: const Color(0xFF192E46),
          extendBody: true,
          appBar: AppBar(
            elevation: 0,
            title: Text(
              widget.character.name,
              style: const TextStyle(
                color: Color(0xFFF37317),
                fontWeight: FontWeight.w900,
                fontSize: 36,
              ),
            ),
            backgroundColor: const Color(0xFF192E46),
            leading: IconButton(
              icon: SvgPicture.asset(
                AppAssets.backBtn,
              ),
              onPressed: () {
                Navigator.popAndPushNamed(context, '/characters');
              },
            ),
          ),
          bottomNavigationBar: _transformations.isNotEmpty
              ? Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CharacterSliderControllerWidget(next: () {
                      _carouselController.nextPage();
                      setState(() {});
                    }, previous: () {
                      _carouselController.previousPage();
                      setState(() {});
                    }),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _transformations[_initialIndex].name,
                              style: const TextStyle(
                                color: Color(0xffF37317),
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Total Ki: ',
                                  style: TextStyle(
                                    color: Color(0xffF37317),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  _transformations[_initialIndex].ki,
                                  style: const TextStyle(
                                    color: Color(0xffEEE8D8),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : null,
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                height: 300,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.character.race,
                              style: const TextStyle(
                                color: Color(0xFFF37317),
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              widget.character.gender,
                              style: const TextStyle(
                                color: Color(0xffEEE8D8),
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Base Ki:',
                              style: TextStyle(
                                color: Color(0xFFF37317),
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              widget.character.ki,
                              style: const TextStyle(
                                color: Color(0xffEEE8D8),
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Total Ki:',
                              style: TextStyle(
                                color: Color(0xFFF37317),
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              widget.character.maxKi,
                              style: const TextStyle(
                                color: Color(0xffEEE8D8),
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Afiliação:',
                              style: TextStyle(
                                color: Color(0xFFF37317),
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              widget.character.affiliation,
                              style: const TextStyle(
                                color: Color(0xffEEE8D8),
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Transformações:',
                              style: TextStyle(
                                color: Color(0xFFF37317),
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Visibility(
                              visible: _transformations.isNotEmpty,
                              replacement: const Text(
                                'N/A',
                                style: TextStyle(
                                  color: Color(0xffEEE8D8),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                ),
                              ),
                              child: Text(
                                '${_transformations.length}',
                                style: const TextStyle(
                                  color: Color(0xffEEE8D8),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Image.network(
                      widget.character.image,
                      width: 154,
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomRight,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
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
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Transformações',
                          style: TextStyle(
                            color: Color(0xffEEE8D8),
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _transformations.isNotEmpty,
                        replacement: const Center(
                          child: Center(child: Text('Sem transformações')),
                        ),
                        child: SizedBox(
                          height: 320,
                          child: CarouselSlider.builder(
                            itemCount: _transformations.length,
                            carouselController: _carouselController,
                            options: CarouselOptions(
                              height: 320,
                              aspectRatio: 16 / 9,
                              onPageChanged: (index, reason) {
                                _initialIndex = index;
                                setState(() {});
                              },
                            ),
                            itemBuilder:
                                (BuildContext context, int itemIndex, int i) {
                              _initialIndex = itemIndex;

                              return Image.network(
                                _transformations[itemIndex].image,
                                height: 320,
                                fit: BoxFit.fitHeight,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
