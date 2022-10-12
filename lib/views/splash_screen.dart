import 'dart:async';

import 'package:covid_19_tracker/views/world_stats.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenSTF();
  }
}
class SplashScreenSTF extends StatefulWidget {
  const SplashScreenSTF({Key? key}) : super(key: key);

  @override
  State<SplashScreenSTF> createState() => _SplashScreenSTFState();
}

class _SplashScreenSTFState extends State<SplashScreenSTF>with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this)..repeat();
  void dispose(){
    super.dispose();
    _controller.dispose();
  }
  void initState(){
    super.initState();
   Timer(Duration(seconds: 5),
     ()=>
     Navigator.push (
     context,
     MaterialPageRoute(builder: (context) =>WordStatsScreen ()),
   ),
   );
  }
  late double height;
  late double width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                  animation: _controller,
                  child: Container(
                    height: 200,
                    width: 200,
                    child: const Center(
                      child: Image(image: AssetImage('images/virus.png')),
                    ),
                  ),
                  builder:(BuildContext context, Widget? child){
                    return Transform.rotate(
                        angle:_controller.value * 2.0 * math.pi,
                    child: child,
                    );
                  }),
              SizedBox(
                height: height*0.2,
              ),
              Align(
                alignment: Alignment.center,
                child: Text('Covid-19 \n Tracker App',
                textAlign:TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:25,
                ),
                ),
              ),
            ],
          ) ),
    );
  }
}

