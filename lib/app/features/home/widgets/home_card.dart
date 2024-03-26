import 'package:dbz_databook/app/core/helpers/responsively.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String image;
  final String title;
  final bool inverse;
  final Function()? onTap;

  const HomeCard({
    super.key,
    required this.image,
    required this.title,
    required this.inverse,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: Responsively.auto(200, MediaQuery.of(context)),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 4,
                ),
              ),
              color: Theme.of(context).colorScheme.surface,
              child: const Center(),
            ),
          ),
          Positioned(
            left: !inverse
                ? Responsively.auto(-20, MediaQuery.of(context))
                : null,
            right:
                inverse ? Responsively.auto(-20, MediaQuery.of(context)) : null,
            top: Responsively.auto(-5, MediaQuery.of(context)),
            child: SizedBox(
              width: Responsively.auto(220, MediaQuery.of(context)),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            bottom: Responsively.auto(60, MediaQuery.of(context)),
            width: MediaQuery.of(context).size.width -
                Responsively.auto(48, MediaQuery.of(context)),
            child: Row(
              mainAxisAlignment:
                  !inverse ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                SizedBox(width: Responsively.auto(24, MediaQuery.of(context))),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Responsively.auto(12, MediaQuery.of(context)),
                    vertical: Responsively.auto(4, MediaQuery.of(context)),
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: Responsively.auto(24, MediaQuery.of(context)),
                      color: Theme.of(context).colorScheme.secondary,
                      shadows: [
                        Shadow(
                          color: Theme.of(context).colorScheme.surface,
                          offset: const Offset(1, 1),
                          blurRadius: 0,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: Responsively.auto(12, MediaQuery.of(context))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
