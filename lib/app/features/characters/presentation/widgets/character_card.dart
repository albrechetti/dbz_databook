import 'package:dbz_databook/app/core/commons/commons.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';

class CharacterCard extends StatelessWidget {
  final CharacterEntity character;

  const CharacterCard({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Responsively.auto(20, MediaQuery.of(context))),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.characterProfile,
            arguments: character,
          );
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              height: 164,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      Responsively.auto(24, MediaQuery.of(context))),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 4,
                  ),
                ),
                color: Theme.of(context).colorScheme.surface,
                child: Padding(
                  padding: EdgeInsets.all(
                      Responsively.auto(20, MediaQuery.of(context))),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          character.name,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            shadows: [
                              Shadow(
                                color: Theme.of(context).colorScheme.surface,
                                offset: const Offset(1, 1),
                                blurRadius: 0,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Responsively.auto(8, MediaQuery.of(context)),
                        ),
                        Row(
                          children: [
                            Text(
                              character.race,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            SizedBox(
                              height:
                                  Responsively.auto(8, MediaQuery.of(context)),
                            ),
                            Text(
                              character.gender,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
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
                              'Poder base:',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            SizedBox(
                              height:
                                  Responsively.auto(8, MediaQuery.of(context)),
                            ),
                            Text(
                              character.ki,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Afiliação:',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            SizedBox(
                              height:
                                  Responsively.auto(8, MediaQuery.of(context)),
                            ),
                            Text(
                              character.affiliation,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: SizedBox(
                width: Responsively.auto(180, MediaQuery.of(context)),
                height: Responsively.auto(180, MediaQuery.of(context)),
                child: Image.network(character.image,
                    fit: BoxFit.fitHeight, alignment: Alignment.bottomRight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
