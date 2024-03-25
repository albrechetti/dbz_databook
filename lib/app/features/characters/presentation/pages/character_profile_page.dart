import 'package:carousel_slider/carousel_slider.dart';
import 'package:dbz_databook/app/features/characters/characters.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: const Center(child: CustomCircularProgressIndicator()),
          );
        } else if (state is ErrorLoadCharacterTransformationsState) {
          return Center(
            child: Text(state.message),
          );
        }
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          extendBody: true,
          appBar: AppBar(
            elevation: 0,
            title: Text(
              widget.character.name,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            backgroundColor: Theme.of(context).colorScheme.background,
            leading: IconButton(
              icon: Image.asset(
                AppAssets.backBtn,
              ),
              onPressed: () {
                Navigator.pop(context);
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
                            SizedBox(
                              width: 200,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  _transformations[_initialIndex].name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Total Ki: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                      ),
                                ),
                                Text(
                                  _transformations[_initialIndex].ki,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
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
                height: 250,
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
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              widget.character.gender,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Base Ki:',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              widget.character.ki,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Total Ki:',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              widget.character.maxKi,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Afiliação:',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              widget.character.affiliation,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Transformações:',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            const SizedBox(width: 16),
                            Visibility(
                              visible: _transformations.isNotEmpty,
                              replacement: Text(
                                'N/A',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                              ),
                              child: Text(
                                '${_transformations.length}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Flexible(
                      child: Image.network(
                        widget.character.image,
                        width: 154,
                        fit: BoxFit.contain,
                        alignment: Alignment.bottomRight,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: CustomThemeData.orangeGradient,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Transformações',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                      ),
                      Visibility(
                        visible: _transformations.isNotEmpty,
                        replacement: SizedBox(
                          height: 320,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error,
                                color: Theme.of(context).colorScheme.onPrimary,
                                size: 48,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Sem transformações',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        child: Flexible(
                          child: SizedBox(
                            height: 240,
                            child: CarouselSlider.builder(
                              itemCount: _transformations.length,
                              carouselController: _carouselController,
                              options: CarouselOptions(
                                height: 240,
                                clipBehavior: Clip.antiAlias,
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
                                  height: 240,
                                  fit: BoxFit.fitHeight,
                                );
                              },
                            ),
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
