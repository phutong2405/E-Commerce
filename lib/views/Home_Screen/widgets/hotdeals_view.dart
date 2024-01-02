import 'dart:math';

import 'package:ecom_app_2411/bloc/app_bloc.dart';
import 'package:ecom_app_2411/bloc/app_bloc_event.dart';
import 'package:ecom_app_2411/views/widgets/display_size.dart';
import 'package:ecom_app_2411/model/product_model.dart';
import 'package:ecom_app_2411/views/widgets/stuff_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget hotDealSpaceHomeContent({
  required BuildContext context,
  required Iterable<Product> products,
  required AppBloc appBloc,
}) {
  return SizedBox(
    height: 260,
    width: displayWidth(context),
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          width: 120,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: "Hot",
                  style: GoogleFonts.comfortaa(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink),
                ),
                TextSpan(
                  text: ' Deals Space',
                  style: GoogleFonts.comfortaa(
                      fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        ...products.map((e) => Transform.rotate(
            angle: Random().nextInt(4) % 2 == 0
                ? 6.2
                : (Random().nextInt(5) % 10) / 40,
            child: hotDealsWidget(
              context: context,
              product: e,
              func: (product) {
                appBloc.add(
                  TapToItemEvent(
                    product: product,
                  ),
                );
              },
            )))
      ],
    ),
  );
}

Widget hotDealsWidget(
    {required BuildContext context,
    required Product product,
    required Function(Product product) func}) {
  return InkWell(
    splashFactory: NoSplash.splashFactory,
    overlayColor: const MaterialStatePropertyAll(Colors.transparent),
    onTap: () {
      func(product);
    },
    child: Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(10),
      width: 180,
      height: (displayWidth(context) - (displayWidth(context) * 0.16)) * 0.6,
      decoration: BoxDecoration(
        color: Colors.white70,
        border: Border.all(width: 0, color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          opacity: 235,
          fit: BoxFit.cover,
          alignment: FractionalOffset.center,
          image: NetworkImage(product.url),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.blueGrey.withOpacity(0.5),
              blurRadius: 5,
              spreadRadius: 0.5,
              offset: const Offset(2, 2))
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: hotDealsPicWidget(context: context, imgUrl: product.url)),
          const Spacer(),
          Container(
            height: 55,
            width: 150,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0),
              // border: Border.all(width: 0.1, color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.hind(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "⭐️ ${product.averageRating}",
                      style: GoogleFonts.hind(
                          fontSize: 16,
                          color: Colors.amber.shade800,
                          fontWeight: FontWeight.bold),
                    ),
                    divineSpace(width: 10),
                    Text(
                      "\$ ${product.actualPrice}",
                      style: GoogleFonts.hind(
                          fontSize: 18,
                          color: Colors.black.withRed(200),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget hotDealsPicWidget(
    {required BuildContext context, required String imgUrl}) {
  return Container(
    margin: const EdgeInsets.all(5),
    width: 150,
    height: 150,
    decoration: BoxDecoration(
      // border: Border.all(width: 1, color: Colors.grey),
      borderRadius: const BorderRadius.all(Radius.circular(7)),
      image: DecorationImage(
        fit: BoxFit.cover,
        alignment: FractionalOffset.center,
        image: NetworkImage(
          imgUrl,
        ),
      ),
    ),
  );
}
