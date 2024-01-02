import 'package:ecom_app_2411/views/Discover_Card/discover_page.dart';
import 'package:ecom_app_2411/views/widgets/display_size.dart';
import 'package:ecom_app_2411/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

Widget exploringSpaceHomeContent({
  required BuildContext context,
  required Iterable<Product> data,
  required Function(Product product) func,
}) {
  return SizedBox(
    height: 550,
    width: displayWidth(context),
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          width: 170,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: "Exploring",
                      style: GoogleFonts.comfortaa(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    TextSpan(
                      text: ' Space',
                      style: GoogleFonts.comfortaa(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: LottieBuilder.asset(
                  "lib/assets/horuniverse.json",
                ),
              ),
            ],
          ),
        ),
        GridView.count(
          scrollDirection: Axis.horizontal,
          crossAxisCount: 4,
          physics:
              const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
          shrinkWrap: true, // You won't see infinite size error
          children: List.generate(52, (index) {
            return InkWell(
              onTap: () {
                func(
                  data.elementAt(index),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(2),
                width:
                    (displayWidth(context) - (displayWidth(context) * 0.16)) *
                        0.6,
                height:
                    (displayWidth(context) - (displayWidth(context) * 0.16)) *
                        0.6,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.1, color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    alignment: FractionalOffset.center,
                    image: NetworkImage(data.elementAt(index).images[0] == ''
                        ? ''
                        : data.elementAt(index).images[0]),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    ),
  );
}
