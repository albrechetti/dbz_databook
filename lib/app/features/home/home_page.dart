import 'package:dbz_databook/app/core/core.dart';
import 'package:flutter/material.dart';

import 'widgets/home_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
                top: Responsively.auto(100, MediaQuery.of(context))),
            decoration: BoxDecoration(
              gradient: CustomThemeData.orangeGradient,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                    Responsively.auto(40, MediaQuery.of(context))),
                topRight: Radius.circular(
                    Responsively.auto(40, MediaQuery.of(context))),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: Responsively.auto(60, MediaQuery.of(context)),
                left: Responsively.auto(20, MediaQuery.of(context)),
                right: Responsively.auto(20, MediaQuery.of(context)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeCard(
                    image: AppAssets.characters,
                    title: 'Personagens',
                    inverse: false,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.characters);
                    },
                  ),
                  HomeCard(
                    image: AppAssets.planets,
                    title: 'Planetas',
                    inverse: true,
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.planets),
                  ),
                  const HomeCard(
                    image: AppAssets.transformations,
                    title: 'Transformações',
                    inverse: false,
                    onTap: null,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: Responsively.auto(50, MediaQuery.of(context)),
            child: SizedBox(
              child: Image(
                image: const AssetImage(AppAssets.dragon),
                fit: BoxFit.fitWidth,
                width: Responsively.auto(80, MediaQuery.of(context)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
