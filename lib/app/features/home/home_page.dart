import 'package:dbz_databook/app/core/commons/constants/app_assets.dart';
import 'package:dbz_databook/app/core/core.dart';
import 'package:flutter/material.dart';

import 'widgets/home_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: CustomThemeData.darkGradient,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              decoration: const BoxDecoration(
                gradient: CustomThemeData.orangeGradient,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 60,
                  left: 20,
                  right: 20,
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
                    const HomeCard(
                      image: AppAssets.planets,
                      title: 'Planetas',
                      inverse: true,
                      onTap: null,
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
            const Positioned(
              top: 50,
              child: SizedBox(
                child: Image(
                  image: AssetImage(AppAssets.dragon),
                  fit: BoxFit.fitWidth,
                  width: 80,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
