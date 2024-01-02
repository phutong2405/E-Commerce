import 'package:ecom_app_2411/views/widgets/display_size.dart';
import 'package:ecom_app_2411/model/product_model.dart';
import 'package:ecom_app_2411/views/Discover_Card/widgets/discover_content.dart';
import 'package:ecom_app_2411/views/widgets/stuff_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget detailInforContent({
  required BuildContext context,
  required Product product,
}) {
  return Container(
    padding: const EdgeInsets.only(left: 25),
    width: displayWidth(context),
    child: ListView(
      // physics: const PageScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        divineSpace(width: 15),
        detailPictureInformation(context: context, product: product),
        divineSpace(width: 15),
        detailContentInformation(
            context: context,
            productTitle: product.title,
            productDescription: product.description),
        divineSpace(width: 15),
        detailReviewInformation(context: context),
      ],
    ),
  );
}

Widget detailContentInformation(
    {required BuildContext context,
    required String productTitle,
    required String productDescription}) {
  return SizedBox(
    // color: Colors.amber,
    width: (displayWidth(context) - (displayWidth(context) * 0.16)) * 0.9,
    height: (displayWidth(context) - (displayWidth(context) * 0.16)) * 0.6,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Details",
          style:
              GoogleFonts.comfortaa(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Text(
              productDescription,
              // maxLines: 7,
              // overflow: TextOverflow.ellipsis,
              style: GoogleFonts.hind(
                  fontSize: displayWidth(context) * 0.038,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.8)),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget detailPictureInformation({
  required BuildContext context,
  required Product product,
}) {
  return SizedBox(
    // color: Colors.amber,
    width: (displayWidth(context) - (displayWidth(context) * 0.16)) * 0.8,
    height: (displayWidth(context) - (displayWidth(context) * 0.16)) * 0.8,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Text(
                product.title,
                style:
                    GoogleFonts.hind(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ...product.images.map(
                (e) => discoverCardContentPic(context: context, url: e),
              )
            ],
          )),
        ),
      ],
    ),
  );
}

Widget detailReviewInformation({
  required BuildContext context,
}) {
  return SizedBox(
    // color: Colors.amber,
    width: (displayWidth(context) - (displayWidth(context) * 0.16)) * 0.9,
    height: (displayWidth(context) - (displayWidth(context) * 0.16)) * 0.6,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reviews",
          style:
              GoogleFonts.comfortaa(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  reviewContent(
                      context: context,
                      authorName: 'phutong',
                      starRated: 4,
                      comment:
                          "The dropdownColor property will allow you to set a background color for the dropdown items. This will change only the dropdown item’s background color, not the selection button color"),
                  reviewContent(
                      context: context,
                      authorName: 'phutong',
                      starRated: 4,
                      comment:
                          "The dropdownColor property will allow you to set a background color for the dropdown items. This will change only the dropdown item’s background color, not the selection button color The dropdownColor property will allow you to set a background color for the dropdown items. This will change only the dropdown item’s background color, not the selection button color"),
                  reviewContent(
                      context: context,
                      authorName: 'phutong',
                      starRated: 4,
                      comment: "Great one"),
                  reviewContent(
                      context: context,
                      authorName: 'phutong',
                      starRated: 4,
                      comment:
                          "The dropdownColor property will allow you to set a background color for the dropdown items. This will change only the dropdown item’s background color, not the selection button color"),
                  reviewContent(
                      context: context,
                      authorName: 'phutong',
                      starRated: 4,
                      comment: "Great one")
                ],
              )),
        ),
      ],
    ),
  );
}

Widget reviewContent(
    {required BuildContext context,
    required String authorName,
    required int starRated,
    required String comment}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        border: Border.all(width: 0.5, color: Colors.grey),
        borderRadius: BorderRadius.circular(6)),
    width: (displayWidth(context) - (displayWidth(context) * 0.16)) * 0.85,
    // height: (displayWidth(context) - (displayWidth(context) * 0.16)) * 0.8,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              authorName,
              style:
                  GoogleFonts.hind(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              starRated.toString(),
              style: GoogleFonts.hind(fontSize: 14),
            ),
            divineSpace(width: 5),
            const Icon(
              Icons.star,
              color: Colors.amber,
            ),
          ],
        ),
        Text(
          comment,
          style: GoogleFonts.hind(
              fontSize: 14,
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.8)),
        ),
      ],
    ),
  );
}
