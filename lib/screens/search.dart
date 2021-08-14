import 'package:corona_app/screens/detail.dart';
import 'package:flutter/material.dart';
import 'package:corona_app/screens/home.dart';
import 'package:corona_app/services/api.dart';

class CustomSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: mylist.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 80.0,
                    ),
                    Text('Oops! no country',
                        style: TextStyle(color: Colors.grey, fontSize: 15.0)),
                  ],
                )
              : ListView.builder(
                  itemCount: mylist.length,
                  itemBuilder: (context, index) {
                    storeList = mylist[index];
                    //print(productItem);
                    return Column(children: [
                      Card(
                          child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Detail(
                                        data: mylist[index],
                                      )));
                        },
                        leading: Image.network(mylist[index].countryInfo.flag,
                            width: 40.0),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [Text('${storeList.country}'), Divider()],
                        ),
                      ))
                    ]);
                  }),
        ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    mylist = query.isEmpty
        ? data
        : data
            .where((e) =>
                e.country.contains(query) ||
                e.country.toLowerCase().contains(query))
            .toList();
    return mylist == null
        ? Text('No Results found')
        : ListView.builder(
            itemCount: mylist.length,
            itemBuilder: (context, index) {
              listItem = mylist[index];
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Detail(
                                    data: mylist[index],
                                  )));
                    },
                    leading:
                        Image.network(listItem.countryInfo.flag, width: 40.0),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text('${listItem.country}')],
                    ),
                  )
                ],
              );
            },
          );
  }
}
