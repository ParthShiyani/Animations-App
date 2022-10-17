import 'package:flutter/material.dart';

class ExplicitBuiltin extends StatefulWidget {
  const ExplicitBuiltin({Key? key}) : super(key: key);

  @override
  State<ExplicitBuiltin> createState() => _ExplicitBuiltinState();
}

class _ExplicitBuiltinState extends State<ExplicitBuiltin>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explicit Animation Built In"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Spacer(),
            RotationTransition(
              turns: animationController,
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
