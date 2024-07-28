import 'package:kids_stories_app/data/model/stories.dart';
import 'package:kids_stories_app/data/sqlite/veritabani_yardimcisi.dart';

class storiesrepo{

  Future<List<stories>> goster() async {
    var db = await VeritabaniYardimcisi.veritabanierisim();
    
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM stories");
    
    return List.generate(maps.length, (i){
      var satir = maps[i];
      return stories(satir["stori_id"], satir["stori_title"], satir["stori_contents"],satir["stori_image"]);
    });
    
  }

  Future<List<stories>> searchStories(String aramasonuc) async {
    var db = await VeritabaniYardimcisi.veritabanierisim();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM stories WHERE stori_title LIKE ?",
        ['%$aramasonuc%']
    );

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return stories(satir["stori_id"], satir["stori_title"], satir["stori_contents"],satir["stori_image"]);
    });
  }


}