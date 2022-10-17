import 'package:flutter/material.dart';

class ImplicitBuiltinTask2 extends StatefulWidget {
  const ImplicitBuiltinTask2({Key? key}) : super(key: key);

  @override
  State<ImplicitBuiltinTask2> createState() => _ImplicitBuiltinTask2State();
}

class _ImplicitBuiltinTask2State extends State<ImplicitBuiltinTask2> {
  bool isFirst = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit Built-in Task 2"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedCrossFade(
              firstCurve: Curves.easeInOutCubicEmphasized,
              firstChild: Container(
                height: 200,
                width: 200,
                color: Colors.amber,
              ),
              secondCurve: Curves.easeInExpo,
              secondChild: Container(
                alignment: Alignment.center,
                height: 150,
                width: 150,
                color: Colors.deepOrange,
                child: const Text(
                  "Hello",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              crossFadeState: isFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              // Duration for crossFade animation.
              duration: const Duration(milliseconds: 600),
            ),
            ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    isFirst = !isFirst;
                  },
                );
              },
              child:
                  const Text("Animate", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
