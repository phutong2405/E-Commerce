// import 'package:ecom_app_2411/display_size.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// Widget filterDicoverContent({required BuildContext context}) {
//   return SizedBox(
//     height: 120,
//     width: displayWidth(context),
//     child: ListView(
//       scrollDirection: Axis.horizontal,
//       children: [
//         Container(
//           width: 130,
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Text(
//             "chose a ZONE",
//             style: GoogleFonts.comfortaa(
//                 fontSize: 22, fontWeight: FontWeight.w500),
//           ),
//         ),
//         // ...List.generate(100, (index) {
//         //   return hotDealsWidget(context: context);
//         // }),
//         ...filterCats.map((e) => hotDealsWidget(context: context, zoneCats: e))
//       ],
//     ),
//   );
// }

// Widget hotDealsWidget(
//     {required BuildContext context, required ZoneCat zoneCats}) {
//   return Container(
//     margin: const EdgeInsets.only(right: 10),
//     padding: const EdgeInsets.all(10),
//     width: 100,
//     height: 120,
//     decoration: BoxDecoration(
//         border: Border.all(width: 0.1, color: Colors.grey),
//         borderRadius: const BorderRadius.all(Radius.circular(10)),
//         gradient: const LinearGradient(colors: [
//           // Colors.grey,
//           // Colors.black,
//           Colors.blue,
//           Colors.purple,
//           Colors.pink
//         ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
//     child: Column(
//       mainAxisSize: MainAxisSize.max,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           zoneCats.iconName,
//           style: const TextStyle(fontSize: 30),
//         ),
//         const Spacer(),
//         Text(
//           zoneCats.name,
//           style: GoogleFonts.hind(
//               fontSize: 18,
//               color: zoneCats.repColor,
//               fontWeight: FontWeight.bold),
//         )
//       ],
//     ),
//   );
// }

import 'package:flutter/material.dart';

List<ZoneCat> filterCats = [
  const ZoneCat(name: "all", iconName: "✨", repColor: Colors.white, list: []),
  const ZoneCat(name: "tech", iconName: "💻", repColor: Colors.white, list: []),
  const ZoneCat(
    name: "life",
    iconName: "🪴",
    repColor: Colors.white,
    list: [],
  ),
  const ZoneCat(
    name: "kitchen",
    iconName: "🍳",
    repColor: Colors.white,
    list: [],
  ),
  const ZoneCat(
    name: "fashion",
    iconName: "👜",
    repColor: Colors.white,
    list: [],
  ),
];

class ZoneCat {
  final String name;
  final String iconName;
  final Color repColor;
  final List<dynamic> list;

  const ZoneCat(
      {required this.name,
      required this.iconName,
      required this.repColor,
      required this.list});
}
