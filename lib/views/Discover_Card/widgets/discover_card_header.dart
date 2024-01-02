import 'package:ecom_app_2411/views/Discover_Card/widgets/discover_card_bottom.dart';
import 'package:ecom_app_2411/views/widgets/display_size.dart';
import 'package:ecom_app_2411/views/widgets/stuff_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget detailHeader(
    {required BuildContext context,
    required String name,
    required Function() func}) {
  return Row(
    children: [
      businessName(context: context, name: name),
      const Spacer(),
      businessBadge(context: context, businessName: '✓', color: Colors.green),
      divineSpace(width: 10),
      businessBadge(context: context, businessName: "Mall", color: Colors.pink),
      divineSpace(width: 10),
      businessBadge(
          context: context,
          businessName: 'Ads',
          color: Colors.black.withRed(255)),
      SizedBox(
        height: displayWidth(context) * 0.1,
        width: displayWidth(context) * 0.1,
        child: discoverCardButton(
          context: context,
          icon: Icons.more_vert,
          color: Theme.of(context).colorScheme.onBackground,
          func: () {
            func();
          },
        ),
      )
    ],
  );
}

Widget businessBadge(
    {required BuildContext context,
    required String businessName,
    required Color color}) {
  return Container(
    padding: const EdgeInsets.all(1),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: color,
          width: 1.5,
        ),
      ),
    ),
    height: displayWidth(context) * 0.08,
    child: Text(
      businessName,
      style: GoogleFonts.comfortaa(
          fontSize: displayWidth(context) * 0.03,
          fontWeight: FontWeight.w500,
          color: color),
    ),
  );
}

Widget businessName({required BuildContext context, required String name}) {
  return Container(
    alignment: Alignment.centerLeft,
    height: displayWidth(context) * 0.1,
    padding: const EdgeInsets.only(),
    width: 180,
    child: Text(
      name,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: GoogleFonts.mPlusRounded1c(
          fontSize: displayWidth(context) * 0.038, fontWeight: FontWeight.w500),
    ),
  );
}
