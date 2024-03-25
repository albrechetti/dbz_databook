import 'package:dbz_databook/app/core/commons/constants/app_assets.dart';
import 'package:flutter/material.dart';

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
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 128),
              Column(
                children: [
                  Image(
                    image: AssetImage(AppAssets.dbzLogo),
                    fit: BoxFit.fitWidth,
                    width: 320,
                  ),
                  Text(
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
