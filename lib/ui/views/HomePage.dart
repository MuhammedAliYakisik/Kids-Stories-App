import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_stories_app/data/model/stories.dart';
import 'package:kids_stories_app/ui/cubit/HomePage_cubit.dart';
import 'package:kids_stories_app/ui/views/DetailPage.dart';
import 'package:kids_stories_app/utils/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool aramayapiliyormu = false;
  String aramakelimesi = "";

  @override
  void initState() {
    super.initState();
    context.read<HomepageCubit>().fetchshow();
  }

  @override
  Widget build(BuildContext context) {
    var oran = MediaQuery.of(context);
    var genislik = oran.size.width;

    return Scaffold(
        backgroundColor: whiteblue,
        appBar: AppBar(
          title: aramayapiliyormu
              ? TextField(
            decoration:
            InputDecoration(hintText: "Arama için birşey giriniz"),
            onChanged: (aramasonuc) {
              setState(() {
                aramakelimesi = aramasonuc;
              });
              context.read<HomepageCubit>().search(aramasonuc);
            },
          )
              : Text(
            " ~ Ana Sayfa ~",
            style: TextStyle(
                fontFamily: "title",
                fontWeight: FontWeight.bold,
                fontSize: genislik / 15),
          ),
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Icon(
            Icons.auto_stories_outlined,
            size: genislik / 15,
          ),
          actions: [
            aramayapiliyormu
                ? IconButton(
              icon: Icon(
                Icons.cancel,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  aramayapiliyormu = false;
                  aramakelimesi = "";
                });
                context.read<HomepageCubit>().fetchshow();
              },
            )
                : IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  aramayapiliyormu = true;
                });
              },
            )
          ],
        ),
        body: BlocBuilder<HomepageCubit, List<stories>>(
            builder: (context, storilist) {
              if (storilist.isNotEmpty) {
                return ListView.builder(
                    itemCount: storilist.length,
                    itemBuilder: (context, indeks) {
                      var stori = storilist[indeks];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(stori)));
                        },
                        child: ListTile(
                          title: Text(
                            "${stori.stori_title}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ),
                      );
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator()
                );
              }
            }));
  }
}
