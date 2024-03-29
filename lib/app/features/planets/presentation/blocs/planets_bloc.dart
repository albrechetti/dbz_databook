import 'package:bloc/bloc.dart';
import 'package:dbz_databook/app/features/planets/domain/usecases/load_planets_usecase.dart';

import '../../../../core/core.dart';
import 'planets_event.dart';
import 'planets_state.dart';

class PlanetsBloc extends Bloc<PlanetsEvent, PlanetsState> {
  final ILoadPlanetsUsecase _loadPlanetsUsecase;

  PlanetsBloc({required ILoadPlanetsUsecase loadPlanetsUsecase})
      : _loadPlanetsUsecase = loadPlanetsUsecase,
        super(LoadingPlanetsState()) {
    on<LoadingPlanetsEvent>(_loadPlanetsEvent);
  }

  _loadPlanetsEvent(
      LoadingPlanetsEvent event, Emitter<PlanetsState> emit) async {
    if (event.isLoading) {
      emit(LoadingPlanetsState());
    }

    final result = await _loadPlanetsUsecase(const NoParam());
    result.fold(
      (exception) => emit(ErrorPlanetsState(message: exception.toString())),
      (planets) => emit(SuccessPlanetsState(planets: planets)),
    );
  }
}
