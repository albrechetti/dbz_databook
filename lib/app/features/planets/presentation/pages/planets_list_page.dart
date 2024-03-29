import 'package:dbz_databook/app/shared/shared.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../planets.dart';

class PlanetsListPage extends StatefulWidget {
  const PlanetsListPage({super.key});

  @override
  State<PlanetsListPage> createState() => _PlanetsListPageState();
}

class _PlanetsListPageState extends State<PlanetsListPage> {
  final _bloc = sl.get<PlanetsBloc>();

  _loadPlanets({bool isLoading = true}) {
    _bloc.add(LoadingPlanetsEvent(isLoading: isLoading));
  }

  @override
  void initState() {
    super.initState();
    _loadPlanets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          'Planetas',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        clipBehavior: Clip.hardEdge,
        elevation: 0,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: BlocBuilder<PlanetsBloc, PlanetsState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is LoadingPlanetsState) {
            return const Center(
              child: CustomCircularProgressIndicator(),
            );
          } else if (state is ErrorPlanetsState) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is SuccessPlanetsState) {
            return Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                gradient: CustomThemeData.orangeGradient,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    Responsively.auto(40, MediaQuery.of(context)),
                  ),
                  topRight: Radius.circular(
                    Responsively.auto(40, MediaQuery.of(context)),
                  ),
                ),
              ),
              child: ListView.builder(
                itemCount: state.planets.length,
                itemBuilder: (context, index) {
                  final planet = state.planets[index];
                  return Padding(
                    padding: EdgeInsets.all(
                      Responsively.auto(8, MediaQuery.of(context)),
                    ),
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          Responsively.auto(40, MediaQuery.of(context)),
                        ),
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 4,
                        ),
                      ),
                      color: Theme.of(context).colorScheme.surface,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: Responsively.auto(20, MediaQuery.of(context)),
                          bottom: Responsively.auto(20, MediaQuery.of(context)),
                        ),
                        child: ListTile(
                          leading: Container(
                            width:
                                Responsively.auto(80, MediaQuery.of(context)),
                            height:
                                Responsively.auto(80, MediaQuery.of(context)),
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              planet.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            planet.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
