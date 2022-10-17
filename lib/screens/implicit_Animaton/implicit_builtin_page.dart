import 'package:flutter/material.dart';

class ImplicitBuiltin extends StatefulWidget {
  const ImplicitBuiltin({Key? key}) : super(key: key);

  @override
  State<ImplicitBuiltin> createState() => _ImplicitBuiltinState();
}

class _ImplicitBuiltinState extends State<ImplicitBuiltin> {
  double size = 150;
  var color = Colors.amber;
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit Animation Built In"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Spacer(),
            AnimatedContainer(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 400),
              height: size,
              width: size,
              color: color,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  (size == 150) ? size = 50 : size = 150;
                  (color == Colors.amber)
                      ? color = Colors.deepOrange
                      : color = Colors.amber;
                });
              },
              child: const Text("Animate Container"),
            ),
            Spacer(),
            AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(seconds: 2),
              child: Container(
                margin: EdgeInsets.all(10),
                height: 150,
                width: 150,
                color: Colors.amber,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  (opacity == 1) ? opacity = 0 : opacity = 1;
                });
              },
              child: const Text("Animate Opacity"),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
