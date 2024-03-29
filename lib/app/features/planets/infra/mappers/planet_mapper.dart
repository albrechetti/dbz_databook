import 'package:dbz_databook/app/features/planets/domain/entities/planet_entity.dart';

class PlanetMapper {
  static PlanetEntity fromMap(Map<String, dynamic> map) {
    return PlanetEntity(
      id: map['id'],
      name: map['name'],
      isDestroyed: map['isDestroyed'],
      description: map['description'],
      image: map['image'],
    );
  }
}
