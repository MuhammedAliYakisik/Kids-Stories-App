import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_stories_app/data/model/stories.dart';
import 'package:kids_stories_app/data/repo/stories_repo.dart';

class HomepageCubit extends Cubit<List<stories>>{
  HomepageCubit():super([]);

  var srepo = storiesrepo();

  Future<void> fetchshow() async {
    var liste = await srepo.goster();
    emit(liste);

  }


}