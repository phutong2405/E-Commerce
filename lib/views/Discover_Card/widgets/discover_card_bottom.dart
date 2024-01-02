import 'package:ecom_app_2411/views/widgets/display_size.dart';
import 'package:ecom_app_2411/views/widgets/stuff_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget discoverCardBottom(
    {required BuildContext context,
    required String price,
    required String discount,
    required String rating}) {
  return Container(
    margin: EdgeInsets.only(
        bottom: displayWidth(context) * 0.02,
        right: displayWidth(context) * 0.02),
    height: displayWidth(context) * 0.08,
    width: displayWidth(context) - (displayWidth(context) * 0.18),
    // color: Colors.blue,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "\$ $price",
          style: GoogleFonts.mPlusRounded1c(
              fontSize: 20,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text(
          "0",
          style: GoogleFonts.mPlusRounded1c(
              fontSize: displayWidth(context) * 0.035,
              color: Colors.blueGrey,
              fontWeight: FontWeight.w500),
        ),
        divineSpace(width: 5),
        Icon(
          CupertinoIcons.tag_fill,
          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
          size: 20,
        ),
        divineSpace(width: 10),
        Text(
          ("$discount %"),
          style: GoogleFonts.mPlusRounded1c(
            fontSize: displayWidth(context) * 0.035,
            fontWeight: FontWeight.bold,
            color: Colors.black.withRed(200),
          ),
        ),
        Icon(
          CupertinoIcons.arrow_down_right,
          color: Colors.black.withRed(200),
          size: 22,
        ),
        divineSpace(width: 10),
        Text(
          rating,
          style: GoogleFonts.mPlusRounded1c(
              fontSize: displayWidth(context) * 0.035,
              color: Colors.blueGrey,
              fontWeight: FontWeight.w500),
        ),
        divineSpace(width: 5),
        const Icon(
          CupertinoIcons.star_fill,
          color: Colors.amber,
        )
      ],
    ),
  );
}

Widget discoverCardButton(
    {required BuildContext context,
    required IconData icon,
    required Function() func,
    required Color color,
    bool? isCart}) {
  return IconButton(
    onPressed: () {
      func();
    },
    icon: Icon(
      icon,
      color: color,
    ),
  );
}
