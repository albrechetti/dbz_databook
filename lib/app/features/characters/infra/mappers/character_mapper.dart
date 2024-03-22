

import '../../domain/domain.dart';

class CharacterMapper {
  static CharacterEntity fromMap(Map<String, dynamic> map) {
    return CharacterEntity(
      id: map['id'],
      ki: map['ki'],
      name: map['name'],
      affiliation: map['affiliation'],
      description: map['description'],
      race: map['race'],
      gender: map['gender'],
      image: map['image'],
      transformations: map['transformations'],
    );
  }
}
