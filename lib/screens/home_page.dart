import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var buttonStyle = OutlinedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
    padding: const EdgeInsets.all(12),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation App"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: [
            btn(
              route: 'hero_page1',
              name: "Hero Animation",
              color: MaterialStateProperty.all(Colors.deepPurple),
            ),
            btn(
              route: 'implicit_builtin',
              name: "Implicit Animation Built=in",
              color: MaterialStateProperty.all(Colors.blue),
            ),
            btn(
              route: 'implicit_builtin_task1',
              name: "Implicit Built-in Task 1",
              color: MaterialStateProperty.all(Colors.blue),
            ),
            btn(
              route: 'implicit_builtin_task2',
              name: "Implicit Built-in Task 2",
              color: MaterialStateProperty.all(Colors.blue),
            ),
            btn(
              route: 'implicit_custom',
              name: "Implicit Animation Custom",
              color: MaterialStateProperty.all(Colors.purpleAccent),
            ),
            btn(
              route: 'implicit_custom_task1',
              name: "Implicit Custom Task 1",
              color: MaterialStateProperty.all(Colors.purpleAccent),
            ),
            btn(
              route: 'implicit_custom_task2',
              name: "Implicit Custom Task 2",
              color: MaterialStateProperty.all(Colors.purpleAccent),
            ),
            btn(
              route: 'explicit_builtin',
              name: "Explicit Animation Built-in",
              color: MaterialStateProperty.all(Colors.green),
            ),
            btn(
              route: 'explicit_builtin_task1',
              name: "Explicit Built-in Task 1",
              color: MaterialStateProperty.all(Colors.green),
            ),
            btn(
              route: 'explicit_custom',
              name: "Explicit Animation Custom",
              color: MaterialStateProperty.all(Colors.amberAccent),
            ),
            btn(
              route: 'explicit_custom_task1',
              name: "Explicit Custom Task 1",
              color: MaterialStateProperty.all(Colors.amberAccent),
            ),
            btn(
              route: 'staggered',
              name: "Staggered Animation",
              color: MaterialStateProperty.all(Colors.orange),
            ),
            btn(
              route: 'staggered_task1',
              name: "Staggered Task 1",
              color: MaterialStateProperty.all(Colors.orange),
            ),
            btn(
              route: 'tween',
              name: "Tween Chaining Animation",
              color: MaterialStateProperty.all(Colors.redAccent),
            ),
          ],
        ),
      ),
    );
  }

  btn({required route, required name, required color}) {
    return Container(
      margin: EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(route);
        },
        child: Text(name),
        style: ButtonStyle(
          backgroundColor: color,
        ),
      ),
    );
  }
}
