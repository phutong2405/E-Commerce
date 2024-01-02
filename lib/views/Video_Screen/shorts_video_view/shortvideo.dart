import 'package:ecom_app_2411/views/Detail_Screen/Down_part_content/widgets/option_area.dart';
import 'package:ecom_app_2411/views/Discover_Card/widgets/discover_card_bottom.dart';
import 'package:ecom_app_2411/views/widgets/display_size.dart';
import 'package:ecom_app_2411/views/widgets/stuff_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShortVideoPage extends StatelessWidget {
  const ShortVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.blue,
        ),
        Positioned(top: 60, child: shortVideoTopButton(context: context)),
        Positioned(bottom: 0, child: shortVideoDownContent(context: context)),
      ],
    );
  }
}

Widget shortVideoTopButton({required BuildContext context}) {
  return Container(
    height: 45,
    width: displayWidth(context),
    alignment: Alignment.bottomCenter,
    child: Row(mainAxisSize: MainAxisSize.min, children: [
      // Text(
      //   "Logz Dimension",
      //   style:
      //       GoogleFonts.spaceGrotesk(fontSize: 20, fontWeight: FontWeight.w500),
      // ),
      divineSpace(width: 5),
      genericTextButton(
          text: "Shorts",
          textColor: Colors.white,
          bgcolor: Colors.black.withOpacity(1),
          colorTapped: Colors.black,
          sized: 25,
          func: () {},
          context: context),
      divineSpace(width: 5),
      genericTextButton(
          text: "Live-Streaming",
          textColor: Colors.white,
          bgcolor: Colors.black.withOpacity(0.1),
          colorTapped: Colors.black,
          sized: 25,
          func: () {},
          context: context)
    ]),
  );
}

Widget shortVideoDownContent({required BuildContext context}) {
  return Container(
    padding: const EdgeInsets.only(left: 2),
    width: displayWidth(context),
    height: displayHeight(context) - (displayHeight(context) * 0.7),
    // color: Colors.blue,
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ///LEFT_HANDED CONTROL BAR
            shortVideoControlBar(context: context),
            divineSpace(width: 5),

            ///RIGHT OPTION AREA
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Iphone 15 Pro Max",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.hind(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    detailPriceLine(
                        context: context,
                        discount: "",
                        coupons: 3,
                        oldPrice: "200",
                        newPrice: "159")
                  ],
                ),
              ),
            )
          ],
        ),

        ///BOTTOM CONTROL BAR
        shortVideoBottomButton(context: context),
      ],
    ),
  );
}

Widget shortVideoControlBar({required BuildContext context}) {
  return SizedBox(
    // color: Colors.amber,
    height: displayHeight(context) * 0.23,
    width: displayWidth(context) * 0.12,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        discoverCardButton(
          context: context,
          icon: Icons.favorite_border,
          color: Theme.of(context).colorScheme.onBackground,
          func: () {},
        ),
        discoverCardButton(
          context: context,
          icon: CupertinoIcons.bookmark,
          color: Theme.of(context).colorScheme.onBackground,
          func: () {},
        ),
        discoverCardButton(
          context: context,
          icon: CupertinoIcons.paperplane,
          color: Theme.of(context).colorScheme.onBackground,
          func: () {},
        ),
        discoverCardButton(
          context: context,
          icon: CupertinoIcons.cart_badge_plus,
          color: Colors.green,
          func: () {},
          isCart: true,
        ),
      ],
    ),
  );
}

Widget shortVideoBottomButton({required BuildContext context}) {
  return Row(
    children: [
      genericTextIconButton(
        icon: CupertinoIcons.cart,
        text: "Add To Cart",
        textColor: Colors.white,
        bgcolor: Colors.white.withOpacity(0.1),
        colorTapped: Colors.greenAccent,
        sized: 25,
        func: () {},
      ),
      divineSpace(width: 10),
      genericTextIconButton(
        icon: CupertinoIcons.money_dollar_circle_fill,
        text: "Check out",
        textColor: Colors.white,
        bgcolor: Colors.black.withOpacity(0.1),
        colorTapped: Colors.pink,
        sized: 25,
        func: () {},
      ),
      divineSpace(width: 10),
      genericTextIconButton(
        icon: CupertinoIcons.info_circle_fill,
        text: "More",
        textColor: Colors.white,
        bgcolor: Colors.black.withOpacity(0.1),
        colorTapped: Colors.amber,
        sized: 25,
        func: () {},
      ),
    ],
  );
}
