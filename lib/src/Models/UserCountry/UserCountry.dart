import 'dart:convert';

UserCountryData userCountryDataFromJson(String str) =>
    UserCountryData.fromJson(json.decode(str));

String userCountryDataToJson(UserCountryData data) => json.encode(
      data.toJson(),
    );

class UserCountryData {
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

  UserCountryData({
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

  factory UserCountryData.fromJson(Map<String, dynamic> json) =>
      UserCountryData(
        country: json['country'],
        countryInfo: CountryInfo.fromJson(json['countryInfo']),
        cases: json['cases'],
        todayCases: json['todayCases'],
        deaths: json['todayDeaths'],
        recovered: json['recovered'],
        active: json['active'],
        critical: json['critical'],
        casesPerOneMillion: json['casesPerOneMillion'].toDouble(),
        deathsPerOneMillion: json['deathsPerOneMillion'].toDouble(),
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
        'casesPerOneMillion': casesPerOneMillion,
        'deathsPerOneMillion': deathsPerOneMillion,
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
        id: json['_id'],
        latitude: json['latitude'],
        longitute: json['longitude'],
        flag: json['flag'],
        iso3: json['iso3'],
        iso2: json['iso2'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'latitude': latitude,
        'longitude': longitute,
        'flag': flag,
        'iso3': iso3,
        'iso2': iso2,
      };
}
