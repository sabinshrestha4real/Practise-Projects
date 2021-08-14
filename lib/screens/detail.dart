import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pie_chart/pie_chart.dart';

class Detail extends StatefulWidget {
  var data;

  Detail({this.data});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // leading: IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.arrow_back),
          // ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.data.countryInfo.flag,
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              // ClipRRect(
              //   borderRadius: BorderRadius.all(Radius.circular(120.0)),
              //   child: Image.network(
              //     widget.data.countryInfo.flag,
              //     height: 50.0,
              //     width: 100.0,
              //   ),
              // ),
              Text('${widget.data.country}'),
            ],
          ),
          // leading: Container(),
          elevation: 0.0,
          // backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   margin: EdgeInsets.only(top: 70.0),
              //   child: CircleAvatar(
              //     backgroundColor: Colors.transparent,
              //     radius: 60.0,
              //     backgroundImage: NetworkImage(widget.data.countryInfo.flag),
              //   ),
              // ),
              // SizedBox(height: 20.0),
              Container(
                  padding: EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 5.0, bottom: 1.0),
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 20.0),
                        decoration: BoxDecoration(
                            color: Color(0xffE7EFEE),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                widget.data.todayCases == 0
                                    ? 'Total Record'
                                    : "Today's Record",
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
                            (widget.data.todayCases).toDouble() == 0 &&
                                    (widget.data.todayDeaths).toDouble() == 0 &&
                                    (widget.data.todayRecovered).toDouble() == 0
                                ? PieChart(
                                    dataMap: {
                                      "Total Cases":
                                          (widget.data.cases).toDouble(),
                                      "Total Death":
                                          (widget.data.deaths).toDouble(),
                                      "Total Recovered":
                                          (widget.data.recovered).toDouble()
                                    },
                                    chartRadius: 200,
                                    colorList: [
                                      Color(0xff5496EF),
                                      Color(0xffFE6A6A),
                                      Color(0xff4DCB77)
                                    ],
                                    animationDuration:
                                        Duration(milliseconds: 2000),
                                    legendOptions: LegendOptions(
                                        showLegendsInRow: true,
                                        legendShape: BoxShape.rectangle,
                                        showLegends: true,
                                        legendPosition: LegendPosition.bottom),
                                    chartValuesOptions: ChartValuesOptions(
                                        chartValueStyle: TextStyle(
                                            fontSize: 10, color: Colors.black),
                                        showChartValueBackground: false,
                                        showChartValuesOutside: true,
                                        showChartValuesInPercentage: true),
                                  )
                                /////wqewqioejqwiojeiqwojeioqweqwioe
                                : PieChart(
                                    dataMap: {
                                      "New Cases":
                                          (widget.data.todayCases).toDouble(),
                                      "New Deaths":
                                          (widget.data.todayDeaths).toDouble(),
                                      "New Recovered":
                                          (widget.data.todayRecovered)
                                              .toDouble()
                                    },
                                    chartRadius: 200,
                                    colorList: [
                                      Color(0xff5496EF),
                                      Color(0xffFE6A6A),
                                      Color(0xff4DCB77)
                                    ],
                                    animationDuration:
                                        Duration(milliseconds: 2000),
                                    legendOptions: LegendOptions(
                                        showLegendsInRow: true,
                                        legendShape: BoxShape.rectangle,
                                        showLegends: true,
                                        legendPosition: LegendPosition.bottom),
                                    chartValuesOptions: ChartValuesOptions(
                                        chartValueStyle: TextStyle(
                                            fontSize: 10, color: Colors.black),
                                        showChartValueBackground: false,
                                        showChartValuesOutside: true,
                                        showChartValuesInPercentage: true),
                                  ),
                            SizedBox(
                              height: 10.0,
                            ),
                            // Divider(
                            //   color: Colors.black,
                            //   thickness: 0.5,
                            // ),
                          ],
                        ),
                      ),
                      widget.data.todayCases == 0
                          ? Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10.0),
                              child: DefaultTextStyle(
                                style: const TextStyle(
                                    fontSize: 18.0, color: Color(0xffFE6A6A)
                                    // fontFamily: 'Agne',
                                    ),
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                        "*Today's data is yet to come..."),
                                  ],
                                  onTap: () {
                                    print("Tap Event");
                                  },
                                ),
                                // Text(
                                //   "*Today's data is yet to come...",
                                //   style: TextStyle(color: Color(0xffFE6A6A)),
                                // ),
                              ))
                          : SizedBox(
                              height: 20.0,
                            ),
                      Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Color(0xffE7EFEE),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Overall Report",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0,
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Total Cases',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(height: 15.0),
                                          Text(
                                            '${widget.data.cases}',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Text(
                                            'Total Death',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(height: 15.0),
                                          Text(
                                            '${widget.data.deaths}',
                                            style:
                                                TextStyle(color: Colors.white),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'New Cases',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(height: 15.0),
                                          Text(
                                            widget.data.todayCases == 0
                                                ? '-'
                                                : '${widget.data.todayCases} ',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Text(
                                            'New Deaths',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(height: 15.0),
                                          Text(
                                            widget.data.todayDeaths == 0
                                                ? '-'
                                                : '${widget.data.todayDeaths}',
                                            style:
                                                TextStyle(color: Colors.white),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Active Cases',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(height: 15.0),
                                          Text(
                                            widget.data.active == 0
                                                ? '-'
                                                : '${widget.data.active}',
                                            style:
                                                TextStyle(color: Colors.white),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Total Tests',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(height: 15.0),
                                          Text(
                                            '${widget.data.tests}',
                                            style:
                                                TextStyle(color: Colors.white),
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xff4DCB77),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0))),
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                              '${widget.data.recovered}',
                                              style: TextStyle(
                                                  color: Colors.white),
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0))),
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'New Recovered',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            SizedBox(height: 15.0),
                                            Text(
                                              widget.data.todayRecovered == 0
                                                  ? '-'
                                                  : '${widget.data.todayRecovered}',
                                              style: TextStyle(
                                                  color: Colors.white),
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
                              // Row(
                              //   children: [
                              //     Expanded(
                              //       child: Container(
                              //         decoration: BoxDecoration(
                              //             color: Color(0xffFE6A6A),
                              //             borderRadius:
                              //                 BorderRadius.all(Radius.circular(10.0))),
                              //         padding: EdgeInsets.all(10.0),
                              //         child: Column(
                              //           crossAxisAlignment: CrossAxisAlignment.center,
                              //           children: [
                              //             Text(
                              //               'Affected Countries',
                              //               style: TextStyle(color: Colors.white),
                              //             ),
                              //             SizedBox(height: 15.0),
                              //             Text(
                              //               '${data.getFetchedData().affectedCountries}',
                              //               style: TextStyle(color: Colors.white),
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       width: 10.0,
                              //     ),
                              //     Expanded(
                              //       child: Container(
                              //         decoration: BoxDecoration(
                              //             color: Color(0xffFE6A6A),
                              //             borderRadius:
                              //                 BorderRadius.all(Radius.circular(10.0))),
                              //         padding: EdgeInsets.all(10.0),
                              //         child: Column(
                              //           crossAxisAlignment: CrossAxisAlignment.center,
                              //           children: [
                              //             Text(
                              //               'Critical',
                              //               style: TextStyle(color: Colors.white),
                              //             ),
                              //             SizedBox(height: 15.0),
                              //             Text(
                              //               '${data.getFetchedData().critical}',
                              //               style: TextStyle(color: Colors.white),
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          )),
                    ],
                  )),
            ],
          ),
        ));
  }
}
