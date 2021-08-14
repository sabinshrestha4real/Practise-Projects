// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));
String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel(
      {
      // required this.updated,
      required this.cases,
      required this.todayCases,
      required this.deaths,
      required this.todayDeaths,
      required this.recovered,
      required this.todayRecovered,
      required this.active,
      required this.critical,
      required this.tests,
      required this.affectedCountries});

  // int updated;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int todayRecovered;
  int active;
  int critical;
  int tests;
  int affectedCountries;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
      // updated: json["updated"],
      cases: json["cases"],
      todayCases: json["todayCases"],
      deaths: json["deaths"],
      todayDeaths: json["todayDeaths"],
      recovered: json["recovered"],
      todayRecovered: json["todayRecovered"],
      active: json["active"],
      critical: json["critical"],
      tests: json["tests"],
      affectedCountries: json["affectedCountries"]);

  Map<String, dynamic> toJson() => {
        // "updated": updated,
        "cases": cases,
        "todayCases": todayCases,
        "deaths": deaths,
        "todayDeaths": todayDeaths,
        "recovered": recovered,
        "todayRecovered": todayRecovered,
        "active": active,
        "critical": critical,
        "tests": tests,
        "affectedCountries": affectedCountries
      };
}
