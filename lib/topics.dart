// import 'package:flutter/material.dart';
//
// class TopPicks extends StatelessWidget {
//   const TopPicks({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text('Top Picks'),
//       ),
//       body: Container(
//         height: 400,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: topPickList.length,
//           itemBuilder: (context, index) {
//             final topPicks = topPickList[index];
//             return Padding(
//               padding: const EdgeInsets.only(left: 20, top: 20),
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.grey,
//                     borderRadius: BorderRadius.circular(5),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.white,
//                         spreadRadius: 3,
//                         blurRadius: 7,
//                       )
//                     ]),
//                 child: Column(
//                   children: [
//                     Image.network(topPicks.url ??
//                         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpVCtPR9Ik9W3Ugf41rmxElxOv2KD4xPpu-A&usqp=CAU'),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Wrap(
//                       crossAxisAlignment: WrapCrossAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.star,
//                           size: 20,
//                           color: Colors.yellow,
//                         ),
//                         topPicks.rating != null
//                             ? Text('${topPicks.rating}')
//                             : Text('0.0')
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     topPicks.title != null
//                         ? Text(
//                       topPicks.title!,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w100,
//                       ),
//                     )
//                         : Text('Title'),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }