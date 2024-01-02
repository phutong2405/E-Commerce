import 'package:ecom_app_2411/bloc/app_bloc_event.dart';
import 'package:ecom_app_2411/views/Discover_Card/widgets/discover_card_bottom.dart';
import 'package:ecom_app_2411/views/Discover_Card/widgets/discover_card_header.dart';
import 'package:ecom_app_2411/views/widgets/display_size.dart';
import 'package:ecom_app_2411/model/product_model.dart';
import 'package:ecom_app_2411/views/widgets/stuff_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget discoverCard(
    {required BuildContext context,
    required Product product,
    required bool isFavorited,
    required bool isSaved,
    required Function(ControlBarItem item) func}) {
  return Stack(
    children: [
      Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: displayHeight(context) * 0.012,
            ),
            padding: const EdgeInsets.only(
              top: 5,
              left: 5,
              bottom: 5,
            ),
            height: displayHeight(context) * 0.35,
            child: Row(
              children: [
                discoverCardControlBar(
                  context: context,
                  product: product,
                  isFavorited: isFavorited,
                  isSaved: isSaved,
                  func: (item) {
                    func(item);
                  },
                ),
                divineSpace(width: displayWidth(context) * 0.02),
                SizedBox(
                  width: displayWidth(context) - (displayWidth(context) * 0.16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      detailHeader(
                        context: context,
                        name: product.brand == ''
                            ? product.seller
                            : product.brand,
                        func: () {},
                      ),
                      discoverCardContent(
                          context: context,
                          productTitle: product.title,
                          productDescription: product.description,
                          imgUrl: product.images),
                      const Spacer(),
                      discoverCardBottom(
                          context: context,
                          price: product.sellingPrice,
                          discount: product.discount,
                          rating: product.averageRating),
                    ],
                  ),
                )
              ],
            ),
          ),
          divineLine(
              colors: [Colors.grey, Colors.grey],
              size: 0.2,
              space: 0,
              start: Alignment.centerLeft)
        ],
      ),
    ],
  );
}

Widget discoverCardControlBar({
  required BuildContext context,
  required Product product,
  required Function(ControlBarItem item) func,
  required bool isFavorited,
  required bool isSaved,
}) {
  return SizedBox(
    height: double.infinity,
    width: displayWidth(context) * 0.12,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
        discoverCardButton(
          context: context,
          icon: isFavorited ? Icons.favorite : Icons.favorite_border,
          color: isFavorited
              ? Colors.pink
              : Theme.of(context).colorScheme.onBackground,
          func: () {
            func(ControlBarItem.like);
          },
        ),
        discoverCardButton(
          context: context,
          icon:
              isSaved ? CupertinoIcons.bookmark_fill : CupertinoIcons.bookmark,
          color: isSaved
              ? Colors.amber
              : Theme.of(context).colorScheme.onBackground,
          func: () {
            func(ControlBarItem.save);
          },
        ),
        discoverCardButton(
          context: context,
          icon: CupertinoIcons.paperplane,
          color: Theme.of(context).colorScheme.onBackground,
          func: () {
            func(ControlBarItem.share);
          },
        ),
        discoverCardButton(
          context: context,
          icon: CupertinoIcons.cart_badge_plus,
          color: Colors.green,
          func: () {
            func(ControlBarItem.cart);
          },
          isCart: true,
        ),
      ],
    ),
  );
}

Widget discoverCardContent({
  required BuildContext context,
  required String productTitle,
  required String productDescription,
  required List<String> imgUrl,
}) {
  return SizedBox(
    height: displayHeight(context) * 0.235,
    width: displayWidth(context) - (displayWidth(context) * 0.16),
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        discoverCardContentInformation(
            context: context,
            productTitle: productTitle,
            productDescription: productDescription),
        divineSpace(width: 5),
        ...imgUrl.map((e) {
          return discoverCardContentPic(context: context, url: e);
        }).toList()
      ],
    ),
  );
}

Widget discoverCardContentInformation(
    {required BuildContext context,
    required String productTitle,
    required String productDescription}) {
  return SizedBox(
    // color: Colors.amber,
    width: (displayWidth(context) - (displayWidth(context) * 0.16)) * 0.5,
    height: (displayWidth(context) - (displayWidth(context) * 0.16)) * 0.6,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productTitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.hind(fontSize: displayWidth(context) * 0.04),
        ),
        Text(
          productDescription,
          maxLines: 7,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.hind(
            fontSize: displayWidth(context) * 0.038,
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
          ),
        ),
      ],
    ),
  );
}

Widget discoverCardContentPic(
    {required BuildContext context, required String url}) {
  return Container(
    margin: const EdgeInsets.all(5),
    constraints: BoxConstraints(
      maxWidth: (displayWidth(context) - (displayWidth(context) * 0.16)) * 0.8,
    ),
    height: (displayWidth(context) - (displayWidth(context) * 0.16)) * 0.6,
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(7.0)),
      child: Image.network(url, fit: BoxFit.fitHeight),
    ),
  );
}
