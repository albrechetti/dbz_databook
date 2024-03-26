import 'package:dbz_databook/app/core/core.dart';
import 'package:flutter/material.dart';

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
      decoration: BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(
            color: Theme.of(context).colorScheme.surface,
            width: 4,
          ),
          end: BorderSide(
            color: Theme.of(context).colorScheme.surface,
            width: 4,
          ),
          start: BorderSide(
            color: Theme.of(context).colorScheme.surface,
            width: 4,
          ),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        gradient: CustomThemeData.bottomBarGradient,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Row(
            children: [
              GestureDetector(
                onTap: widget.previous,
                child: Image.asset(AppAssets.backBtn),
              ),
              const Spacer(),
              GestureDetector(
                onTap: widget.next,
                child: Transform.flip(
                  flipX: true,
                  child: Image.asset(AppAssets.backBtn),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
