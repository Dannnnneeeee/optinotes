import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:optinotes/src/pages/auth/login.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showMain = false;
  bool showSubtitle = false;

  @override
  void initState() {
    super.initState();
    // buku + logo
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() => showMain = true);
    });

    // subtitle muncul belakangan
    Future.delayed(const Duration(milliseconds: 1650), () {
      setState(() => showSubtitle = true);
    });
    Future.delayed(const Duration(milliseconds: 4200), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginForm()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF3A8C8A),
      extendBodyBehindAppBar: false,
      body: SizedBox.expand(
        child: Stack(
          children: [

            // Buku atas
            Align(
              alignment: Alignment.topRight,
              child: AnimatedOpacity(
                opacity: showMain ? 1 : 0,
                duration: const Duration(milliseconds: 1000),
                child: Image.asset(
                  "assets/images/atas.png",
                  width: size.width * 1,
                ),
              ),
            ),

            // Buku bawah
            Align(
              alignment: Alignment.bottomLeft,
              child: AnimatedOpacity(
                opacity: showMain ? 1 : 0,
                duration: const Duration(milliseconds: 1000),
                child: Image.asset(
                  "assets/images/bawah.png",
                  width: size.width * 1,
                ),
              ),
            ),

            // Logo tengah
            Center(
              child: AnimatedScale(
                scale: showMain ? 1 : 0.85,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeOut,
                child: AnimatedOpacity(
                  opacity: showMain ? 1 : 0,
                  duration: const Duration(milliseconds: 1000),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SvgPicture.asset(
                        "assets/icons/camera-lens-ai-fill.svg",
                        width: 88,
                      ),

                      const SizedBox(width: 4),

                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const Text(
                              "ptiNotes",
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 48,
                                color: Color(0xffCEDBC0),
                              ),
                            ),

                            const SizedBox(height: 2),

                            SizedBox(
                              width: 180,
                              child: AnimatedOpacity(
                                opacity: showSubtitle ? 1 : 0,
                                duration: const Duration(milliseconds: 400),
                                child: showSubtitle
                                    ? AnimatedTextKit(
                                  isRepeatingAnimation: false,
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      'Optimized Your Notes',
                                      speed:
                                      const Duration(milliseconds: 70),
                                      textStyle: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFFB7C7A3),
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                )
                                    : const SizedBox(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}