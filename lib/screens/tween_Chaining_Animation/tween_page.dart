import 'package:flutter/material.dart';

class TweenPage extends StatefulWidget {
  const TweenPage({Key? key}) : super(key: key);

  @override
  State<TweenPage> createState() => _TweenPageState();
}

class _TweenPageState extends State<TweenPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation sizeAnimation;
  late Animation colorAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    sizeAnimation = TweenSequence([
      // weight = time Ex. 1 = (2000 millisecond / 4 ) Per item 500 milliseconds
      TweenSequenceItem(tween: Tween<double>(begin: 350, end: 150), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 150, end: 250), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 250, end: 100), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 100, end: 150), weight: 1),
    ]).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0,
          0.1,
          curve: Curves.bounceOut,
        ),
      ),
    );
    colorAnimation =
        ColorTween(begin: Colors.amber, end: Colors.deepOrange).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.1,
          1,
          curve: Curves.easeInOut,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tween Chaining Animation"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Spacer(),
            AnimatedBuilder(
              animation: animationController,
              builder: (context, widget) => Container(
                height: sizeAnimation.value,
                width: sizeAnimation.value,
                decoration: BoxDecoration(
                  color: colorAnimation.value,
                  shape: BoxShape.circle,
                ),
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
