import 'package:dbz_databook/app/features/characters/domain/entities/character_entity.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  CharacterEntity character;

  CharacterCard({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/characters');
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
                            color: Color(0xffEEE8D8),
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
                            Text(character.race),
                            const SizedBox(width: 8),
                            Text(character.gender)
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Poder base:'),
                            const SizedBox(width: 8),
                            Text(character.ki)
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Afiliação:'),
                            const SizedBox(width: 8),
                            Text(character.affiliation)
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
              top: -16,
              child: SizedBox(
                height: 200,
                child: Image.network(
                  character.image,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
