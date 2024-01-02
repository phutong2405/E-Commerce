import 'package:ecom_app_2411/bloc/app_bloc.dart';
import 'package:ecom_app_2411/bloc/app_bloc_event.dart';
import 'package:ecom_app_2411/model/purchase_product.dart';
import 'package:ecom_app_2411/repo/local_data.dart';
import 'package:ecom_app_2411/views/Discover_Card/widgets/discover_card_bottom.dart';
import 'package:ecom_app_2411/views/widgets/display_size.dart';
import 'package:ecom_app_2411/model/product_model.dart';
import 'package:ecom_app_2411/views/Detail_Screen/Down_part_content/widgets/option_area.dart';
import 'package:ecom_app_2411/views/widgets/stuff_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget detailPageControlBar({
  required BuildContext context,
  required Product product,
  required Function(ControlBarItem controlBarItem) func,
}) {
  bool isFavorited = favList.contains(product);
  bool isSaved = saveList.contains(product);
  return SizedBox(
    // color: Colors.amber,
    height: displayHeight(context) * 0.23,
    width: displayWidth(context) * 0.12,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        discoverCardButton(
          context: context,
          icon: CupertinoIcons.arrow_left,
          color: Theme.of(context).colorScheme.onBackground,
          func: () {
            Navigator.pop(context);
          },
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
      ],
    ),
  );
}

Widget detailBottomButton({
  required BuildContext context,
  required AppBloc appBloc,
  required Product product,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      genericTextIconButton(
        icon: CupertinoIcons.cart,
        text: "Add To Cart",
        textColor: Theme.of(context).colorScheme.onBackground,
        bgcolor: Theme.of(context).colorScheme.onPrimary.withOpacity(0),
        colorTapped: Colors.greenAccent,
        sized: 25,
        func: () {
          appBloc.add(
            ControlBarTappedEvent(
              itemType: ControlBarItem.cart,
              item: product,
            ),
          );
        },
      ),
      divineSpace(width: 10),
      genericTextIconButton(
        icon: CupertinoIcons.money_dollar_circle_fill,
        text: "Check out",
        textColor: Theme.of(context).colorScheme.onPrimary,
        bgcolor: Theme.of(context).colorScheme.onBackground.withOpacity(1),
        colorTapped: Colors.pink,
        sized: 25,
        func: () {
          Purchase tmp = Purchase(
              product: product,
              amount: 1,
              price: double.parse(product.sellingPrice),
              progress: Progress.inCart);
          appBloc.add(
            CheckOutTappedEvent(
              purchase: [tmp],
            ),
          );
        },
      ),
      divineSpace(width: 10),
      genericTextIconButton(
        icon: CupertinoIcons.chat_bubble_2_fill,
        text: "Chat",
        textColor: Theme.of(context).colorScheme.onPrimary,
        bgcolor: Theme.of(context).colorScheme.onBackground.withOpacity(1),
        colorTapped: Colors.amber,
        sized: 25,
        func: () {},
      ),
    ],
  );
}
