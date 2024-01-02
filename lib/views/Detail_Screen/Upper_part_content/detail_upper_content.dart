import 'package:ecom_app_2411/views/Discover_Card/widgets/discover_card_header.dart';
import 'package:ecom_app_2411/views/widgets/display_size.dart';
import 'package:ecom_app_2411/model/product_model.dart';
import 'package:ecom_app_2411/views/widgets/stuff_view.dart';
import 'package:flutter/material.dart';

Widget detailUpperContent({
  required BuildContext context,
  required Product product,
}) {
  return Container(
    padding: const EdgeInsets.only(top: 5, left: 5),
    width: displayWidth(context),
    height: displayHeight(context) * 0.59,
    // color: Colors.red,
    child: Row(
      children: [
        /// Left_handed Decorate Bar
        detailPageLeftDecorate(context: context, product: product),

        /// Detail Content Area
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              children: [
                detailHeader(
                  context: context,
                  name: product.brand,
                  func: () {},
                ),
                divineLine(colors: [
                  Colors.transparent,
                  Colors.grey,
                  Colors.transparent
                ], space: 0, size: 0.1, start: Alignment.centerLeft),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget detailPageLeftDecorate(
    {required BuildContext context, required Product product}) {
  return Column(children: [
    Container(
      height: displayWidth(context) * 0.1,
      width: displayWidth(context) * 0.1,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(product.url),
      ),
    ),
    Expanded(
      child: Container(
        margin: const EdgeInsets.only(bottom: 0),
        width: 1.5,
        height: double.infinity,
        color: Colors.grey,
      ),
    ),
  ]);
}
