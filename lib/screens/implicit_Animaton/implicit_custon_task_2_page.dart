import 'package:flutter/material.dart';

class ImplicitCustomTask2 extends StatefulWidget {
  const ImplicitCustomTask2({Key? key}) : super(key: key);

  @override
  State<ImplicitCustomTask2> createState() => _ImplicitCustomTask2State();
}

class _ImplicitCustomTask2State extends State<ImplicitCustomTask2> {
  double start = 19.5;
  double finish = 7;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Implicit custom Task 2"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            alignment: const Alignment(0, 0),
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                height: 400,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  border: Border.symmetric(
                    vertical: BorderSide(
                      color: Colors.amber,
                      width: 160,
                    ),
                    horizontal: BorderSide(
                      color: Colors.deepOrange,
                      width: 165,
                    ),
                  ),
                ),
              ),
              Container(
                child: TweenAnimationBuilder(
                  curve: Curves.bounceOut,
                  tween: Tween<double>(begin: start, end: finish),
                  duration: const Duration(milliseconds: 3000),
                  builder: (context, double val, child) {
                    return Transform.scale(
                      scale: val,
                      child: SizedBox(
                        height: val,
                        child: Image.asset(
                          "assets/images/earth.png",
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                start == 19.5 ? start = 7 : start = 19.5;
                finish == 7 ? finish = 19.5 : finish = 7;
              });
            },
            child: Text("Animate"),
          ),
        ],
      ),
    );
  }
}
