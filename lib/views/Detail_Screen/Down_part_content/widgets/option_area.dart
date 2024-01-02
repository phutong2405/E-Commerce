import 'package:ecom_app_2411/views/widgets/display_size.dart';
import 'package:ecom_app_2411/model/product_model.dart';
import 'package:ecom_app_2411/views/widgets/stuff_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget detailOptionArea({
  required BuildContext context,
  required Product product,
  required Function() amountFunc,
  required Function() couponsFunc,
}) {
  return SizedBox(
    height: displayHeight(context) * 0.23,
    width: displayWidth(context) - (displayWidth(context) * 0.15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        detailHeaderMoreInfor(
          context: context,
          remains: product.stock,
          buyRate: "0",
          likeRate: "0",
          rating: product.averageRating,
        ),
        detailPriceLine(
            context: context,
            coupons: 2,
            discount: product.discount,
            oldPrice: product.actualPrice,
            newPrice: product.sellingPrice),
        ...detailOptionPane(
          context: context,
          typeSelected: product.title,
          amountFunc: () {},
          couponsFunc: () {},
        ),
      ],
    ),
  );
}

Widget detailPriceLine(
    {required BuildContext context,
    required int coupons,
    required String discount,
    required String oldPrice,
    required String newPrice}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Icon(
        CupertinoIcons.tag_fill,
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
        size: 18,
      ),
      divineSpace(width: 5),
      Text(
        coupons.toString(),
        style: GoogleFonts.hind(fontSize: 18, color: Colors.blueGrey),
      ),
      divineSpace(width: 10),
      Text(
        ("$discount %"),
        style: GoogleFonts.hind(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: Colors.black.withRed(200),
        ),
      ),
      Icon(
        CupertinoIcons.arrow_down,
        size: 20,
        color: Colors.black.withRed(200),
      ),
      const Spacer(),
      const Text(
        "\$",
        style: TextStyle(fontSize: 20),
      ),
      DefaultTextStyle(
        style: GoogleFonts.hind(
            fontSize: 26,
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.black.withRed(200),
            decorationThickness: 1.5,
            color: Theme.of(context).colorScheme.onBackground),
        child: Text(oldPrice),
      ),
      divineSpace(width: 10),
      const Text(
        "\$",
        style: TextStyle(fontSize: 20),
      ),
      DefaultTextStyle(
        style: GoogleFonts.hind(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black.withRed(200)),
        child: Text(newPrice),
      ),
    ],
  );
}

Widget detailHeaderMoreInfor(
    {required BuildContext context,
    required String remains,
    required String buyRate,
    required String likeRate,
    required String rating}) {
  return Container(
    margin: EdgeInsets.only(
        top: displayWidth(context) * 0.02,
        bottom: displayWidth(context) * 0.02,
        right: displayWidth(context) * 0.02),
    height: displayWidth(context) * 0.06,
    width: displayWidth(context) - (displayWidth(context) * 0.18),
    // color: Colors.blue,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        textInformationBarWidget(context: context, content: "$remains remains"),
        const Spacer(),
        textInformationBarWidget(context: context, content: buyRate),
        divineSpace(width: 5),
        Icon(
          CupertinoIcons.cart_fill,
          // color: Colors.green,
          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
        ),
        divineSpace(width: 15),
        textInformationBarWidget(context: context, content: likeRate),
        divineSpace(width: 5),
        Icon(
          Icons.favorite,
          // color: Colors.pink,
          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
        ),
        divineSpace(width: 15),
        textInformationBarWidget(context: context, content: rating),
        divineSpace(width: 5),
        Icon(
          CupertinoIcons.star_fill,
          // color: Colors.amber,
          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
        )
      ],
    ),
  );
}

Text textInformationBarWidget(
    {required BuildContext context, required String content}) {
  return Text(
    content,
    style: GoogleFonts.mPlusRounded1c(
        fontSize: displayWidth(context) * 0.035,
        color: Colors.blueGrey,
        fontWeight: FontWeight.w500),
  );
}

List<Widget> detailOptionPane({
  required BuildContext context,
  required String typeSelected,
  required Function() amountFunc,
  required Function() couponsFunc,
}) {
  return [
    // InkWell(
    //   borderRadius: BorderRadius.circular(7),
    //   splashColor: Colors.black.withOpacity(0.2),
    //   onTap: () {},
    //   child: Container(
    //     alignment: Alignment.centerRight,
    //     width: displayWidth(context) - (displayWidth(context) * 0.3),
    //     height: 35,
    //     child: Text(
    //       typeSelected,
    //       maxLines: 1,
    //       overflow: TextOverflow.ellipsis,
    //       style: GoogleFonts.hind(fontSize: 14, color: Colors.blueGrey),
    //     ),
    //   ),
    // ),
    // const Spacer(),
    Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          buttonInOptionPane(
            context: context,
            buttonTitle: "Amount:",
            content: "1",
            func: () {
              amountFunc();
            },
          ),
          divineSpace(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Coupons:",
                style: GoogleFonts.hind(fontSize: 15),
              ),
              genericTextIconButton(
                icon: CupertinoIcons.tag_fill,
                text: "More",
                textColor: Colors.white,
                bgcolor: Colors.black.withRed(200),
                colorTapped: Colors.blueGrey,
                sized: 20,
                func: () {
                  couponsFunc();
                },
              ),
            ],
          ),
        ],
      ),
    ),
  ];
}

Column buttonInOptionPane({
  required BuildContext context,
  required String buttonTitle,
  required String content,
  required Function() func,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        buttonTitle,
        style: GoogleFonts.hind(fontSize: 15),
      ),
      genericTextButton(
        context: context,
        text: content,
        textColor: Theme.of(context).colorScheme.onPrimary,
        bgcolor: Colors.grey,
        colorTapped: Colors.blueGrey,
        sized: 20,
        func: () {
          func();
        },
      ),
    ],
  );
}

TextButton genericTextIconButton(
    {required IconData icon,
    required String text,
    required Color textColor,
    required Color bgcolor,
    required Color colorTapped,
    required double sized,
    required Function() func}) {
  return TextButton.icon(
    style: ButtonStyle(
      overlayColor: MaterialStateColor.resolveWith((states) => colorTapped),
      backgroundColor: MaterialStatePropertyAll(bgcolor),
      shape: const MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    ),
    onPressed: () {
      func();
    },
    icon: Icon(
      size: sized,
      icon,
      color: textColor,
    ),
    label: Text(
      text,
      style: TextStyle(
        color: textColor,
      ),
    ),
  );
}

TextButton genericTextButton(
    {required String text,
    required Color textColor,
    required Color bgcolor,
    required Color colorTapped,
    required double sized,
    required Function() func,
    required BuildContext context}) {
  return TextButton(
    style: ButtonStyle(
      overlayColor: MaterialStateColor.resolveWith((states) => colorTapped),
      backgroundColor: MaterialStatePropertyAll(bgcolor),
      shape: const MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    ),
    onPressed: () {
      func();
    },
    child: Text(
      text,
      style: TextStyle(
        color: textColor,
      ),
    ),
  );
}

DropdownButton dropdownButton(
    {required BuildContext context,
    required List<dynamic> items,
    required Function() func}) {
  return DropdownButton(
    items: items.map((value) {
      return DropdownMenuItem(
        value: value,
        child: Text(value.runtimeType == int ? value.toString() : value),
      );
    }).toList(),
    onChanged: (_) {},
  );
}
