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
            height: 164,
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
              child: Center(
                child: Row(
                  mainAxisAlignment: !inverse
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        title,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
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
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: !inverse ? -20 : null,
            right: inverse ? -20 : null,
            top: -20,
            child: SizedBox(
              width: 220,
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
