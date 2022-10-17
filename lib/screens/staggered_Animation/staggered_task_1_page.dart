import 'package:flutter/material.dart';

class StraggeredPageTask1 extends StatefulWidget {
  const StraggeredPageTask1({Key? key}) : super(key: key);

  @override
  State<StraggeredPageTask1> createState() => _StraggeredPageTask1State();
}

class _StraggeredPageTask1State extends State<StraggeredPageTask1>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation sizeAnimation;
  late Animation colorAnimation;

  double being = 200;
  double end = 100;
  Color color1 = Colors.amber;
  Color color2 = Colors.deepOrange;

  bool isStop = false;

  @override
  void initState() {
    super.initState();
    controller();
  }

  controller() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    sizeAnimation = Tween(begin: being, end: end).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0,
          0.5,
          curve: Curves.bounceOut,
        ), // With Curves Effects
      ),
    );
    colorAnimation = ColorTween(begin: color1, end: color2).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.5,
          1,
          curve: Curves.easeInOut,
        ), // With Curves Effects
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Staggered Animation Task 1"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // animationController.repeat();
                setState(() {
                  isStop = false;
                });
                repeatAnimation();
              },
              child: const Text("Repeat Start to end & end to start"),
            ),
            const Spacer(),
            AnimatedBuilder(
              animation: animationController,
              builder: (context, widget) => Container(
                color: colorAnimation.value,
                height: sizeAnimation.value,
                width: sizeAnimation.value,
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

  repeatAnimation() {
    Future.delayed(
      const Duration(milliseconds: 2000),
      () => isStop
          ? null
          : setState(() {
              (being == 200) ? being = 100 : being = 200;
              (end == 100) ? end = 200 : end = 100;
              (color1 == Colors.amber)
                  ? color1 = Colors.deepOrange
                  : color1 = Colors.amber;
              (color2 == Colors.deepOrange)
                  ? color2 = Colors.amber
                  : color2 = Colors.deepOrange;
              animationController.dispose();
              controller();
              animationController.repeat();
              repeatAnimation();
            }),
    );
  }
}
