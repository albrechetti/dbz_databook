import 'package:dbz_databook/app/core/commons/constants/app_assets.dart';
import 'package:dbz_databook/app/features/characters/characters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CharacterSliderControllerWidget extends StatefulWidget {
  final Function() previous;
  final Function() next;
  const CharacterSliderControllerWidget(
      {super.key, required this.previous, required this.next});

  @override
  State<CharacterSliderControllerWidget> createState() =>
      _CharacterSliderControllerWidgetState();
}

class _CharacterSliderControllerWidgetState
    extends State<CharacterSliderControllerWidget> {
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
                onTap: widget.previous,
                child: SvgPicture.asset(
                  AppAssets.backBtn,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: widget.next,
                child: Transform.flip(
                  flipX: true,
                  child: SvgPicture.asset(
                    AppAssets.backBtn,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
