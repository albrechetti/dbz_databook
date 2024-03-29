import 'package:dbz_databook/app/features/planets/domain/entities/planet_entity.dart';

abstract class PlanetsState {
  const PlanetsState();
}

class LoadingPlanetsState extends PlanetsState {}

class SuccessPlanetsState extends PlanetsState {
  final List<PlanetEntity> planets;

  SuccessPlanetsState({required this.planets});
}

class ErrorPlanetsState extends PlanetsState {
  final String message;

  ErrorPlanetsState({required this.message});
}
