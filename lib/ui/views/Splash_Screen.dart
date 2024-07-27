import 'package:flutter/material.dart';
import 'package:kids_stories_app/ui/views/HomePage.dart';
import 'package:kids_stories_app/utils/color.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> alphavalue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,duration: Duration(seconds: 4));
    alphavalue = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.addStatusListener((status){
      if(status == AnimationStatus.completed){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
      }
    });

    controller.forward();


  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    var oran = MediaQuery.of(context);
    var genislik = oran.size.width;
    var uzunluk = oran.size.height;

    return Scaffold(
      backgroundColor: whiteblue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(" ~ WELCOME ~ ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: genislik/14,fontFamily: "title"),),
            Opacity(opacity: alphavalue.value,child: Image.asset("assets/icon/kid.png")),
          ],
        ),
      )
    );
  }
}
