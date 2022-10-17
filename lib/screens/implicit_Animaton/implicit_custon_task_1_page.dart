import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitCustomTask1 extends StatefulWidget {
  const ImplicitCustomTask1({Key? key}) : super(key: key);

  @override
  State<ImplicitCustomTask1> createState() => _ImplicitCustomTask1State();
}

class _ImplicitCustomTask1State extends State<ImplicitCustomTask1> {
  bool isAnimate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit Custom Task 1"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            isAnimate
                ? TweenAnimationBuilder(
                    curve: Curves.bounceOut,
                    tween: Tween<double>(begin: 0, end: pi * 2),
                    duration: const Duration(seconds: 4),
                    builder: (context, double degreeVal, child) {
                      return Transform.rotate(
                        angle: degreeVal,
                        child: Image.asset(
                          "assets/images/earth.png",
                          height: 150,
                        ),
                      );
                    },
                  )
                : Image.asset(
                    "assets/images/earth.png",
                    height: 150,
                  ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isAnimate = true;
                });
                Future.delayed(
                  const Duration(seconds: 4),
                  () => setState(() {
                    isAnimate = false;
                  }),
                );
              },
              child: const Text("Animate"),
            ),
          ],
        ),
      ),
    );
  }
}
