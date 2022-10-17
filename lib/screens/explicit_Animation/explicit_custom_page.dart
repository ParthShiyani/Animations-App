import 'dart:math';

import 'package:flutter/material.dart';

class ExplicitCustom extends StatefulWidget {
  const ExplicitCustom({Key? key}) : super(key: key);

  @override
  State<ExplicitCustom> createState() => _ExplicitCustomState();
}

class _ExplicitCustomState extends State<ExplicitCustom>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
      //  For Control being and end Value of Animation Controller
      lowerBound: 0,
      upperBound: pi * 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explicit Animation Custom"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Spacer(),
            AnimatedBuilder(
              animation: animationController,
              child: Image.asset("assets/images/earth.png", height: 200),
              builder: (context, widget) => Transform.rotate(
                angle: animationController.value,
                child: widget,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        animationController.forward();
                      },
                      child: const Text("Animate"),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        animationController.reverse();
                      },
                      child: const Text("Revers Animate"),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        animationController.repeat();
                      },
                      child: const Text("Repeat Animate"),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        animationController.stop();
                      },
                      child: const Text("Stop Animate"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
