import 'package:corona_app/model/countryModel.dart';
import 'package:corona_app/services/api.dart';
import 'package:flutter/cupertino.dart';

import 'model.dart';

class FetchAPI extends ChangeNotifier {
  var _fetchedData;
  var _fetchAllData;
  getFetchedData() => _fetchedData;
  getFetchedAllData() => _fetchAllData;

  void fetchIt() async {
    _fetchedData = await ApiService.fetchData();
    notifyListeners();
  }

  void fetchAll() {
    _fetchAllData = ApiService.fetechAll();

    notifyListeners();
  }
}
