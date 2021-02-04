import 'dart:convert';

List<Country> allCountriesFromJson(String str) => List<Country>.from(
      json.decode(str).map(
            (x) => Country.fromJson(x),
          ),
    );

String allCountriesToJson(List<Country> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (x) => x.toJson(),
        ),
      ),
    );

class Country {
  String country;
  CountryInfo countryInfo;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  double casesPerOneMillion;
  double deathsPerOneMillion;

  Country({
    this.country,
    this.countryInfo,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        country: json['country'],
        countryInfo: CountryInfo.fromJson(json['countryInfo']),
        cases: json['cases'],
        todayCases: json['todayCases'],
        deaths: json['todayDeaths'],
        recovered: json['recovered'],
        active: json['active'],
        critical: json['critical'],
        casesPerOneMillion: json['casesPerOneMillion'] == null
            ? null
            : json['casesPerOneMillion'].toDouble(),
        deathsPerOneMillion: json['deathsPerOneMillion'] == null
            ? null
            : json['deathsPerOneMillion'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'country': country,
        'countryInfo': countryInfo.toJson(),
        'cases': cases,
        'todayCases': todayCases,
        'deaths': deaths,
        'todayDeaths': todayDeaths,
        'recovered': recovered,
        'active': active,
        'critical': critical,
        'casesPerOneMillion':
            casesPerOneMillion == null ? null : casesPerOneMillion,
        'deathsPerOneMillion':
            deathsPerOneMillion == null ? null : deathsPerOneMillion,
      };
}

class CountryInfo {
  int id;
  dynamic longitute;
  dynamic latitude;
  String flag;
  String iso3;
  String iso2;

  CountryInfo({
    this.id,
    this.longitute,
    this.latitude,
    this.flag,
    this.iso3,
    this.iso2,
  });

  factory CountryInfo.fromJson(Map<String, dynamic> json) => CountryInfo(
        id: json['_id'] == null ? null : json['_id'],
        latitude: json['latitude'].toDouble(),
        longitute: json['longitude'].toDouble(),
        flag: json['flag'],
        iso3: json['iso3'] == null ? null : json['iso3'],
        iso2: json['iso2'] == null ? null : json['iso2'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id == null ? null : id,
        'latitude': latitude,
        'longitude': longitute,
        'flag': flag,
        'iso3': iso3 == null ? null : iso3,
        'iso2': iso2 == null ? null : iso2,
      };
}
