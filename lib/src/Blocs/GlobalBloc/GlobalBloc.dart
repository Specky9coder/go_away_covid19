import 'package:go_away/src/Models/Global/Global.dart';
import 'package:go_away/src/Repository/Repository.dart';
import 'package:rxdart/rxdart.dart';

final bloc = GlobalBloc();

class GlobalBloc {
  final _repository = Repository();

// ignore: close_sinks
  final globalFetcher = BehaviorSubject<List<Country>>();

  Stream<List<Country>> get allAbout => globalFetcher.stream;

  getGlobalData() async {
    List<Country> global = await _repository.getAllCountriesData();
    globalFetcher.sink.add(global);
  }

  dispose() {
    globalFetcher.close();
  }

}
