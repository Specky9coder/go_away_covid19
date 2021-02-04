import 'dart:convert';

Latest latestFromJson(String str) => Latest.fromJson(
      json.decode(str),
    );

String latestToJson(Latest data) => json.encode(
      data.toJson(),
    );

class Latest {
  int cases;
  int deaths;
  int recovered;
  int updated;

  Latest({
    this.cases,
    this.deaths,
    this.recovered,
    this.updated,
  });

  factory Latest.fromJson(Map<String, dynamic> json) => Latest(
        cases: json['cases'],
        deaths: json['deaths'],
        recovered: json['recovered'],
        updated: json['updated'],
      );

  Map<String, dynamic> toJson() => {
        'cases': cases,
        'deaths': deaths,
        'recovered': recovered,
        'updated': updated,
      };
}
