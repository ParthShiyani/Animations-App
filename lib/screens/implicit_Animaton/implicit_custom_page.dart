import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitCustom extends StatefulWidget {
  const ImplicitCustom({Key? key}) : super(key: key);

  @override
  State<ImplicitCustom> createState() => _ImplicitCustomState();
}

class _ImplicitCustomState extends State<ImplicitCustom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.1),
      appBar: AppBar(
        title: const Text("Implicit Animation Custom"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(
                begin: 0,
                end: MediaQuery.of(context).size.height * 0.60,
              ),
              duration: const Duration(milliseconds: 3000),
              curve: Curves.bounceOut,
              builder: (context, double offsetVal, child) {
                return Transform.translate(
                  offset: Offset(0, offsetVal),
                  child: TweenAnimationBuilder(
                    curve: Curves.easeInOut,
                    tween: Tween<double>(begin: 0, end: pi * 2),
                    duration: const Duration(milliseconds: 3000),
                    builder: (context, double degreeVal, child) {
                      return Transform.rotate(
                        angle: degreeVal,
                        child: TweenAnimationBuilder(
                          duration: const Duration(milliseconds: 3000),
                          tween: ColorTween(
                              begin: Colors.purple.withOpacity(0.5),
                              end: Colors.blue),
                          builder: (context, Color? colorVal, child) {
                            return ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                  colorVal!, BlendMode.modulate),
                              child: Image.asset(
                                "assets/images/earth.png",
                                height: 200,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
