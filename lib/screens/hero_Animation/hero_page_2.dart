import 'package:flutter/material.dart';

class HeroPage2 extends StatefulWidget {
  const HeroPage2({Key? key}) : super(key: key);

  @override
  State<HeroPage2> createState() => _HeroPage2State();
}

class _HeroPage2State extends State<HeroPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text("Hero Animation Page 2"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("hero_page1");
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
      ),
    );
  }
}
