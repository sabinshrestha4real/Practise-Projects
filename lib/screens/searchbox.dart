// // import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';

// Align sar(BuildContext context, fetch) {
//     return Align(
//           alignment: Alignment.center,
//           child: Container(
//             // alignment: Alignment.center,
//             padding: EdgeInsets.only(left: 20.0, top: 15.0, right: 10.0),
//             child: GestureDetector(
//                 onTap: () {
//                   fetch.getFetchedAllData();
//                 },
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(child: Text('Search')),
//                     Icon(Icons.search)
//                   ],
//                 )),
//             // color: Colors.white,
//             height: MediaQuery.of(context).size.width / 8,
//             width: MediaQuery.of(context).size.width / 1.2,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//             ),
//           ),
//         );
//   }