import 'package:flutter/material.dart';

class ImplicitBuiltinTask1 extends StatefulWidget {
  const ImplicitBuiltinTask1({Key? key}) : super(key: key);

  @override
  State<ImplicitBuiltinTask1> createState() => _ImplicitBuiltinTask1State();
}

class _ImplicitBuiltinTask1State extends State<ImplicitBuiltinTask1> {
  double size = 150;
  double border = 5;
  double radius = 0;
  double angle = 0;
  Color containerColor = Colors.deepOrange;
  Color borderColor = Colors.amber;

  unstopable() async {
    Future.delayed(
      const Duration(milliseconds: 400),
      () => setState(() {
        if (size == 150) {
          size = 50;
          border = 50;
          radius = 70;
          angle = 3.9;
          containerColor = Colors.deepOrange;
          borderColor = Colors.amber;
        } else {
          size = 150;
          border = 1;
          angle = 5.5;

          radius = 50;
          containerColor = Colors.deepPurpleAccent;
          borderColor = Colors.purple;
        }
        unstopable();
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    unstopable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Implicit Built-in Task 1"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Transform.rotate(
          angle: angle,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            height: size,
            width: size,
            decoration: BoxDecoration(
              color: containerColor,
              boxShadow: [
                BoxShadow(
                  color: containerColor,
                  spreadRadius: 10,
                  blurRadius: 10,
                ),
              ],
              border: Border.all(
                color: borderColor,
                width: border,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
