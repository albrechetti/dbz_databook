import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(20),
      child: InkWell(
        onTap: () {
          Navigator.popAndPushNamed(
            context,
            '/character-profile',
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
                  borderRadius: BorderRadius.circular(24),
                  side: const BorderSide(
                    color: Color(0xffF37317),
                    width: 4,
                  ),
                ),
                color: const Color(0xff2A231C),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          character.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffF37317),
                            shadows: [
                              Shadow(
                                color: Color(0xff2A231C),
                                offset: Offset(1, 1),
                                blurRadius: 0,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              character.race,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xffF37317),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              character.gender,
                              style: const TextStyle(
                                color: Color(0xffEEE8D8),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Poder base:',
                              style: TextStyle(
                                color: Color(0xffF37317),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              character.ki,
                              style: const TextStyle(
                                color: Color(0xffEEE8D8),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Afiliação:',
                              style: TextStyle(
                                  color: Color(0xffF37317),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              character.affiliation,
                              style: const TextStyle(
                                color: Color(0xffEEE8D8),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
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
                width: 164,
                height: 164,
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
