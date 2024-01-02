import 'package:ecom_app_2411/views/widgets/display_size.dart';
import 'package:ecom_app_2411/views/Discover_Card/widgets/filter_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget zoneSpaceHomeContent(
    {required BuildContext context,
    required bool isFilter,
    required List<ZoneCat> list}) {
  return SizedBox(
    height: isFilter ? 46 : 110,
    width: displayWidth(context),
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          alignment: Alignment.center,
          width: 130,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            isFilter ? "Logz" : "take a GIFT",
            style: isFilter
                ? GoogleFonts.spaceGrotesk(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onBackground,
                  )
                : GoogleFonts.comfortaa(
                    fontSize: 28, fontWeight: FontWeight.w500),
          ),
        ),
        ...list.map(
          (e) => giftZoneWidget(
            context: context,
            zoneCats: e,
            isFilter: isFilter,
          ),
        )
      ],
    ),
  );
}

Widget giftZoneWidget(
    {required BuildContext context,
    required ZoneCat zoneCats,
    required bool isFilter}) {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    padding: const EdgeInsets.all(10),
    width: 95,
    height: 60,
    decoration: BoxDecoration(
        border: Border.all(width: 0.1, color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
            colors: isFilter
                ? [
                    Colors.pink,
                    Colors.purple,
                    Colors.blue,
                  ]
                : [Colors.blue, Colors.purple, Colors.pink],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight)),
    child: isFilter == false
        ? Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                zoneCats.iconName,
                style: const TextStyle(fontSize: 25),
              ),
              const Spacer(),
              Text(
                zoneCats.name,
                style: GoogleFonts.hind(
                    fontSize: 16,
                    color: zoneCats.repColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        : Text(
            zoneCats.name,
            style: GoogleFonts.hind(
                fontSize: 16,
                color: zoneCats.repColor,
                fontWeight: FontWeight.bold),
          ),
  );
}

List<ZoneCat> zoneCats = [
  const ZoneCat(
      name: "suprise", iconName: "✨", repColor: Colors.white, list: []),
  const ZoneCat(
      name: "50% off", iconName: "🔥", repColor: Colors.white, list: []),
  const ZoneCat(
    name: "free to delivery",
    iconName: "📦",
    repColor: Colors.white,
    list: [],
  ),
  const ZoneCat(
    name: "buy 1 get 1 free",
    iconName: "🎁",
    repColor: Colors.white,
    list: [],
  ),
  const ZoneCat(
    name: "refund!!!",
    iconName: "💰",
    repColor: Colors.white,
    list: [],
  ),
];
