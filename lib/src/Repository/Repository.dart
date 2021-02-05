import 'package:go_away/src/Models/Global/Global.dart';
import 'package:go_away/src/Models/Latest/Latest.dart';
import 'package:go_away/src/Models/News/News.dart';

import 'ApiProvider.dart';

class Repository {
  var apiProvider = ApiProvider();

  Future<Latest> getGloballyLatestData() => apiProvider.getGloballyLatestData();

  Future<List<Country>> getAllCountriesData() =>
      apiProvider.getAllCountriesData();

  Future<Country> getUserCountryData(String countryCode) =>
      apiProvider.getUserCountryData(countryCode);

  Future<News> getNewses() => apiProvider.getNewses();
}
