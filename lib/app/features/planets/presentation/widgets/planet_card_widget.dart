import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';

class PlanetCardWidget extends StatelessWidget {
  final PlanetEntity planet;
  const PlanetCardWidget({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
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
              width: Responsively.auto(80, MediaQuery.of(context)),
              height: Responsively.auto(80, MediaQuery.of(context)),
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
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
