import 'dart:convert';

import 'package:corona_app/model/countryModel.dart';
import 'package:corona_app/model/model.dart';
import 'package:http/http.dart' as http;

List<Country> data = [];

class ApiService {
  // var response;

  static Future<DataModel> fetchData() async {
    var decode;
    var response =
        await http.get(Uri.parse('https://corona.lmao.ninja/v2/all'));

    try {
      if (response.statusCode == 200) {
        decode = jsonDecode(response.body);

        return DataModel.fromJson(decode);
      } else if (response.statusCode != 200) {
        throw Exception('error');
      }
    } catch (e) {
      print(e);
    }
    return decode;
  }

  static Future<List<Country>> fetechAll() async {
    var decode2;
    var response2 =
        await http.get(Uri.parse('https://corona.lmao.ninja/v2/countries'));
    try {
      if (response2.statusCode == 200) {
        decode2 = jsonDecode(response2.body);
        decode2.map((e) => data.add(Country.fromJson(e))).toList();
        // return data;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      throw Exception(e);
    }
    return data;
  }
}
