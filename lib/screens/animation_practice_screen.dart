import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/utils/navigation_util.dart';
import 'package:lottie/lottie.dart';

class AnimationPracticeScreen extends StatefulWidget {
  @override
  State<AnimationPracticeScreen> createState() => _AnimationPracticeScreenState();
}

class _AnimationPracticeScreenState extends State<AnimationPracticeScreen> {
  final _random = Random();
  double _h = 100;
  double _w = 100;
  double _r = 8;
  Color _c = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animations")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                NavigationUtil.navigateToHeroScreen(context);
              },
              child: Lottie.network(
                "https://assets3.lottiefiles.com/private_files/lf30_sht3vjls.json",
              ),
            ),
            SizedBox(height: 24),
            buildHero(context),
            SizedBox(height: 24),
            Container(
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Hello world!',
                    textStyle: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 500),
                  ),
                ],
                totalRepeatCount: 4,
                pause: const Duration(milliseconds: 200),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
            ),
            SizedBox(height: 24),
            animatedContainer,
          ],
        ),
      ),
    );
  }

  Widget buildHero(BuildContext context) => InkWell(
        onTap: () {
          NavigationUtil.navigateToHeroScreen(context);
        },
        child: Hero(
          tag: "profile",
          child: Image.asset(
            "assets/user-profile.png",
            width: 100,
            height: 100,
          ),
        ),
      );

  Widget get animatedContainer => InkWell(
        onTap: () {
          setState(() {
            _h = _random.nextInt(100).toDouble() + 30;
            _w = _random.nextInt(100).toDouble() + 30;
            _r = _random.nextInt(50).toDouble();
            _c = Color.fromRGBO(
              _random.nextInt(256),
              _random.nextInt(256),
              _random.nextInt(256),
              1,
            );
          });
        },
        child: AnimatedContainer(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          height: this._h,
          width: this._w,
          decoration: BoxDecoration(
            color: this._c,
            borderRadius: BorderRadius.circular(_r),
          ),
          duration: Duration(milliseconds: 500),
        ),
      );
}
