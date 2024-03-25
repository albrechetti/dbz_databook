import 'package:dbz_databook/app/core/commons/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 80,
      width: double.infinity,
      decoration: const BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(
            color: Color(0xFF2A231C),
            width: 4,
          ),
          end: BorderSide(
            color: Color(0xFF2A231C),
            width: 4,
          ),
          start: BorderSide(
            color: Color(0xFF2A231C),
            width: 4,
          ),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF3D71AC),
            Color(0xFF192E46),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.backBtn,
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Voltar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Image.asset(
                AppAssets.dragon,
                width: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
