abstract class PlanetsEvent {
  const PlanetsEvent();
}

class LoadingPlanetsEvent extends PlanetsEvent {
  final bool isLoading;

  LoadingPlanetsEvent({required this.isLoading});
}
