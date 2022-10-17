import 'dart:math';

import 'package:flutter/material.dart';

class ExplicitCustomTask1 extends StatefulWidget {
  const ExplicitCustomTask1({Key? key}) : super(key: key);

  @override
  State<ExplicitCustomTask1> createState() => _ExplicitCustomTask1State();
}

class _ExplicitCustomTask1State extends State<ExplicitCustomTask1>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  double lowerBound = 0;
  double upperBound = pi * 2;

  @override
  void initState() {
    super.initState();
    controller();
  }

  controller() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
      //  For Control being and end Value of Animation Controller
      lowerBound: lowerBound,
      upperBound: upperBound,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explicit Custom Task 1"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              onPressed: () {
                setState(() {
                  lowerBound = 0;
                  upperBound = pi * 2;
                  animationController.dispose();
                  controller();
                });
              },
              child: Text("Reste"),
            ),
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
