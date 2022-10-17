import 'package:animation/screens/explicit_Animation/explicit_builtin_page.dart';
import 'package:animation/screens/explicit_Animation/explicit_builtin_task_1.dart';
import 'package:animation/screens/explicit_Animation/explicit_custom_page.dart';
import 'package:animation/screens/explicit_Animation/explicit_custom_task_1.dart';
import 'package:animation/screens/hero_Animation/hero_page_1.dart';
import 'package:animation/screens/hero_Animation/hero_page_2.dart';
import 'package:animation/screens/home_page.dart';
import 'package:animation/screens/implicit_Animaton/implicit_builtin_page.dart';
import 'package:animation/screens/implicit_Animaton/implicit_builtin_task_1_page.dart';
import 'package:animation/screens/implicit_Animaton/implicit_builtin_task_2_page.dart';
import 'package:animation/screens/implicit_Animaton/implicit_custom_page.dart';
import 'package:animation/screens/implicit_Animaton/implicit_custon_task_1_page.dart';
import 'package:animation/screens/implicit_Animaton/implicit_custon_task_2_page.dart';
import 'package:animation/screens/staggered_Animation/staggered_page.dart';
import 'package:animation/screens/staggered_Animation/staggered_task_1_page.dart';
import 'package:animation/screens/tween_Chaining_Animation/tween_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        'hero_page1': (context) => HeroPage1(),
        'hero_page2': (context) => HeroPage2(),
        'hero': (context) => HeroPage1(),
        'implicit_builtin': (context) => ImplicitBuiltin(),
        'implicit_builtin_task1': (context) => ImplicitBuiltinTask1(),
        'implicit_builtin_task2': (context) => ImplicitBuiltinTask2(),
        'implicit_custom': (context) => ImplicitCustom(),
        'implicit_custom_task1': (context) => ImplicitCustomTask1(),
        'implicit_custom_task2': (context) => ImplicitCustomTask2(),
        'explicit_builtin': (context) => ExplicitBuiltin(),
        'explicit_builtin_task1': (context) => ExplicitBuiltinTask1(),
        'explicit_custom': (context) => ExplicitCustom(),
        'explicit_custom_task1': (context) => ExplicitCustomTask1(),
        'staggered': (context) => StraggeredPage(),
        'staggered_task1': (context) => StraggeredPageTask1(),
        'tween': (context) => TweenPage(),
      },
    ),
  );
}
