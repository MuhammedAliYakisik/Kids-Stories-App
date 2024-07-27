import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_stories_app/data/model/stories.dart';
import 'package:kids_stories_app/ui/cubit/HomePage_cubit.dart';
import 'package:kids_stories_app/ui/views/DetailPage.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomepageCubit>().fetchshow();
  }

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
      body: BlocBuilder<HomepageCubit,List<stories>>(
        builder: (context,storilist){
          if(storilist.isNotEmpty){
            return ListView.builder(itemCount: storilist.length,
                itemBuilder: (context,indeks){
              var stori = storilist[indeks];
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage()));
                },
                child: ListTile(
                  title: Text("${stori.stori_title}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                  subtitle: Text("${stori.stori_contents}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                ),
              ),

              );});
          }else{
            return Center(

            );
          }
        }
      )
    );
  }
}
