import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kids_stories_app/data/model/stories.dart';
import 'package:kids_stories_app/utils/color.dart';

class DetailPage extends StatefulWidget {

  stories _stori;


  DetailPage(this._stori);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var oran = MediaQuery.of(context);
    var genislik = oran.size.width;
    var uzunluk = oran.size.height;

    return Scaffold(
      backgroundColor: whiteblue,
      appBar: AppBar(
        title: Text(
          "${widget._stori.stori_title}",
          style: TextStyle(
              fontFamily: "title",
              fontWeight: FontWeight.bold,
              fontSize: genislik / 15),
        ),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,

      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: genislik/20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Image.asset("assets/image/${widget._stori.stori_image}"),
                SizedBox(height: uzunluk/20,),
                Text("${widget._stori.stori_contents}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: genislik/20),),
                SizedBox(height: uzunluk/40,),
                Text(
                  " ~ Son... ~",
                  style: TextStyle(
                      fontFamily: "title",
                      fontWeight: FontWeight.bold,
                      fontSize: genislik / 15),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
