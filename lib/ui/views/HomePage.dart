import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    var oran = MediaQuery.of(context);
    var genislik = oran.size.width;
    var uzunluk = oran.size.height;

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text(" ~ Ana Sayfa ~",style: TextStyle(fontFamily: "title",fontWeight: FontWeight.bold,fontSize: genislik/15),),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.auto_stories_outlined,size: genislik/15,),

      ),
      body: Center(
        child: Column(
          children: [


          ],
        ),
      ),
    );
  }
}
