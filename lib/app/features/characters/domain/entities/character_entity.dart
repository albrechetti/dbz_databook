import '../domain.dart';

class CharacterEntity {
  final int id;
  final String ki;
  final String name;
  final String race;
  final String gender;
  final String image;
  final String description;
  final String affiliation;
  final List<TransformationEntity>? transformations;

  CharacterEntity({
    required this.id,
    required this.ki,
    required this.name,
    required this.race,
    required this.gender,
    required this.image,
    required this.description,
    required this.affiliation,
    required this.transformations,
  });
}
