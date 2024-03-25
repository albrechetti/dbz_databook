import 'package:dbz_databook/app/features/characters/domain/domain.dart';

class TransformationMapper {
  static List<TransformationEntity> fromMap(List<dynamic>? map) {
    if (map == null) {
      return [];
    }

    final transformations = map.map((e) {
      return TransformationEntity(
        id: e['id'],
        name: e['name'],
        image: e['image'],
        ki: e['ki'],
      );
    }).toList();

    return transformations;
  }
}
