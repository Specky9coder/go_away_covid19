import 'package:go_away/src/Models/News/News.dart';
import 'package:go_away/src/Repository/Repository.dart';
import 'package:rxdart/rxdart.dart';

final bloc = NewsBLoc();

class NewsBLoc {
  final _repository = Repository();
  final newsFetcher = BehaviorSubject<News>();

  Stream<News> get newses => newsFetcher.stream;

  getNewses() async {
    News newses = await _repository.getNewses();
    newsFetcher.sink.add(newses);
  }

  dispose() {
    newsFetcher.close();
  }
}
