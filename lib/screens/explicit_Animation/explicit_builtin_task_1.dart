import 'package:flutter/material.dart';

class ExplicitBuiltinTask1 extends StatefulWidget {
  const ExplicitBuiltinTask1({Key? key}) : super(key: key);

  @override
  State<ExplicitBuiltinTask1> createState() => _ExplicitBuiltinTask1State();
}

class _ExplicitBuiltinTask1State extends State<ExplicitBuiltinTask1>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      //  For Control being and end Value of Animation Controller
      // lowerBound: 0,
      // upperBound: 1,
    );

    animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, 1.8),
    ).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explicit Built-in Task 1"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SlideTransition(
              position: animation,
              child: Image.asset("assets/images/earth.png", height: 200),
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
