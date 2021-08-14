// import 'package:corona_app/model/chartModel.dart';
// import 'package:corona_app/model/model.dart';
import 'package:corona_app/model/countryModel.dart';
import 'package:corona_app/model/provider.dart';
// import 'package:corona_app/screens/detail.dart';
import 'package:corona_app/screens/search.dart';
// import 'package:corona_app/screens/searchbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:corona_app/services/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

var storeList;
var mylist;
dynamic listItem;

class _HomePageState extends State<HomePage> {
  var fetch;
  var forchart;
  @override
  void initState() {
    fetch = Provider.of<FetchAPI>(context, listen: false);
    fetch.fetchIt();
    fetch.fetchAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Color(0xff8FB8F0),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "",
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Text(
              "Corona Report",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              // alignment: Alignment.center,
              padding: EdgeInsets.only(left: 20.0, top: 15.0, right: 10.0),
              child: GestureDetector(
                  onTap: () {
                    showSearch(context: context, delegate: CustomSearch());
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text('Search')),
                      Icon(Icons.search)
                    ],
                  )),
              // color: Colors.white,
              height: MediaQuery.of(context).size.width / 8,
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xffE7EFEE),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22))),
              child: ListViewing(),
            ),
          ),
        ],
      ),
    );
  }

  Widget ListViewing() {
    return Consumer<FetchAPI>(builder: (context, data, child) {
      if (data.getFetchedData() == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else
        return RefreshIndicator(
          backgroundColor: Colors.grey[200],
          color: Colors.grey[600],
          displacement: 100,
          strokeWidth: 3,
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 1));
            data.fetchIt();
          },
          child: Container(
              padding: EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 5.0, bottom: 1.0),
              child: ListView(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                    decoration: BoxDecoration(
                        color: Color(0xffE7EFEE),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Today's Record",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        PieChart(
                          dataMap: {
                            "New Cases":
                                (data.getFetchedData().todayCases).toDouble(),
                            "New Deaths":
                                (data.getFetchedData().todayDeaths).toDouble(),
                            "New Recovered":
                                (data.getFetchedData().todayRecovered)
                                    .toDouble(),
                          },
                          chartRadius: 200,
                          colorList: [
                            Color(0xff5496EF),
                            Color(0xffFE6A6A),
                            Color(0xff4DCB77)
                          ],
                          animationDuration: Duration(milliseconds: 2000),
                          legendOptions: LegendOptions(
                              showLegendsInRow: true,
                              legendShape: BoxShape.rectangle,
                              showLegends: true,
                              legendPosition: LegendPosition.bottom),
                          chartValuesOptions: ChartValuesOptions(
                              chartValueStyle:
                                  TextStyle(fontSize: 10, color: Colors.black),
                              showChartValueBackground: false,
                              showChartValuesOutside: true,
                              showChartValuesInPercentage: true),
                        ),
                        // SizedBox(
                        //   height: 10.0,
                        // ),
                        Divider(
                          color: Colors.black,
                          thickness: 0.5,
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 20.0,
                  // ),

                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Overall Report",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFE6A6A),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Total Cases',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                '${data.getFetchedData().cases}',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                'Total Death',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                '${data.getFetchedData().deaths}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFE6A6A),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'New Cases',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                '${data.getFetchedData().todayCases}',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                'New Deaths',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                '${data.getFetchedData().todayDeaths}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff5496EF),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Active Cases',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                '${data.getFetchedData().active}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff5496EF),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Total Tests',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                '${data.getFetchedData().tests}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                    decoration: BoxDecoration(
                        // color: Color(0xff4DCB77),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff4DCB77),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    'Total Recovered',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15.0),
                                Text(
                                  '${data.getFetchedData().recovered}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff4DCB77),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'New Recovered',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(height: 15.0),
                                Text(
                                  '${data.getFetchedData().todayRecovered}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFE6A6A),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Affected Countries',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                '${data.getFetchedData().affectedCountries}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFE6A6A),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Critical',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                '${data.getFetchedData().critical}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        );
    });
  }
}
