import 'package:flutter/material.dart';

class HeroPage1 extends StatefulWidget {
  const HeroPage1({Key? key}) : super(key: key);

  @override
  State<HeroPage1> createState() => _HeroPage1State();
}

class _HeroPage1State extends State<HeroPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: const Text("Hero Animation Page 1"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed("hero_page2");
            },
            child: const Hero(
              tag: "logo",

              // placeholderBuilder: (context, _, __) {
              //   return const CircularProgressIndicator();
              // },

              // flightShuttleBuilder: (flightContext, animation, flightDirection,
              //         fromHeroContext, toHeroContext) =>
              //     Icon(Icons.arrow_forward_ios, size: 150),

              /* if you use flightShuttle in both page than
               if touch on first page hero than u show second page flightShuttele
               and if touch on second page hero than u show first page flightShuttele
               */

              // Don't Use Because After Use This Animation Is not Properly Work.
              child: FlutterLogo(
                size: 100,
                style: FlutterLogoStyle.horizontal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
