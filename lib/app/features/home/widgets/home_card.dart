import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String image;
  final String title;
  final bool inverse;

  const HomeCard(
      {super.key,
      required this.image,
      required this.title,
      required this.inverse});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/characters');
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: 164,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: const BorderSide(
                  color: Color(0xffF37317),
                  width: 4,
                ),
              ),
              color: const Color(0xff2A231C),
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
                        color: const Color(0xffF37317),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffEEE8D8),
                          shadows: [
                            Shadow(
                              color: Color(0xff2A231C),
                              offset: Offset(1, 1),
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
