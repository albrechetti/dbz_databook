import 'package:dbz_databook/app/core/commons/constants/app_assets.dart';
import 'package:flutter/material.dart';

import 'widgets/home_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF192E46),
              Color(0xFF000000),
              Color(0xFF000000),
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFF37317),
                    Color(0xFFF37317),
                    Color(0xFFF39E3D),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeCard(
                        image: AppAssets.characters,
                        title: 'Personagens',
                        inverse: false),
                    HomeCard(
                        image: AppAssets.planets,
                        title: 'Planetas',
                        inverse: true),
                    HomeCard(
                        image: AppAssets.transformations,
                        title: 'Transformações',
                        inverse: false),
                  ],
                ),
              ),
            ),
            const Positioned(
              top: 60,
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
