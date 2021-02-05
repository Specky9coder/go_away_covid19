import 'dart:convert';
import 'dart:io';
import 'package:go_away/src/Models/Latest/Latest.dart';
import 'package:go_away/src/Models/News/News.dart';
import 'package:http/http.dart';
import 'package:go_away/src/Models/Global/Global.dart';
import 'package:intl/intl.dart';

class ApiProvider {
  Client client = new Client();
  final _covidDataSource = 'https://coronavirus-tracker-api.herokuapp.com/v2';
  final _newsDataSource =
      'http://newsapi.org/v2/everything?q=COVID&apiKey=a8e98ea61ecc4aa69be04b13de6508bd&from=2020-03-27&sortBy=publishedAt&page=1&language=en';

  // ignore: missing_return
  Future<List<Country>> getAllCountriesData() async {
    print('getGlobalData()');

    var response = await client.get(
        'https://corona.lmao.ninja/v2/countries?sort=cases',
        headers: {HttpHeaders.acceptHeader: 'application/json'});

    print('Global Data Response: ${response.body.toString}');

    if (response.statusCode == 200) {
      return allCountriesFromJson((response.body));
    } else {
      throw Exception('Failed To Get Global Data');
    }
  }

  // ignore: missing_return
  Future<Latest> getGloballyLatestData() async {
    print('getGloballyLatestData()');

    var response = await client.get('https://corona.lmao.ninja/v2/all',
        headers: {HttpHeaders.acceptHeader: 'application/json'});

    print('Global Data Response:${response.body.toString()}');
    if (response.statusCode == 200) {
      return Latest.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed To Get Global Data');
    }
  }

  // ignore: missing_return
  Future<News> getNewses() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);

    print(
        'getNewses() from :http://newsapi.org/v2/everything?q=coronavirus&apiKey=a8e98ea61ecc4aa69be04b13de6508bd&from=$formattedDate&sortBy=publishedAt&page=1&language=en');

    var response = await client.get(
        'http://newsapi.org/v2/everything?q=COVID&apiKey=a8e98ea61ecc4aa69be04b13de6508bd&from=$formattedDate&sortBy=publishedAt&page=1&language=en',
        headers: {HttpHeaders.acceptHeader: 'application/json'});

    print('newses response: ${response.body.toString()}');

    if (response.statusCode == 200) {
      return News.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed To Get Newses.');
    }
  }

  Future<Country> getUserCountryData(String country) async {
    print('getUserCountryData()');
    var response = await client.get(
        'https://corona.lmao.ninja/v2/countries/$country',
        headers: {HttpHeaders.acceptHeader: 'application/json'});

    print('user country data response: ${response.body.toString()}');

    if (response.statusCode == 200) {
      return Country.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed To Get Global Data.');
    }
  }
}
