import 'package:flutter/material.dart';

import '../../core/core.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  Future<void> navToHome() async {
    await Future.delayed(const Duration(milliseconds: 1200));
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  void initState() {
    super.initState();
    navToHome();
  }

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: Responsively.auto(128, MediaQuery.of(context))),
              Column(
                children: [
                  Image(
                    image: const AssetImage(AppAssets.dbzLogo),
                    fit: BoxFit.fitWidth,
                    width: Responsively.auto(320, MediaQuery.of(context)),
                  ),
                  const Text(
                    'Databook',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
