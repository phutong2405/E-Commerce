import 'package:ecom_app_2411/bloc/app_bloc.dart';
import 'package:ecom_app_2411/bloc/app_bloc_event.dart';
import 'package:ecom_app_2411/model/purchase_product.dart';
import 'package:ecom_app_2411/repo/local_data.dart';
import 'package:ecom_app_2411/views/Check_Out_Screen/check_out_view.dart';
import 'package:ecom_app_2411/views/widgets/display_size.dart';
import 'package:ecom_app_2411/views/Detail_Screen/Down_part_content/widgets/option_area.dart';
import 'package:ecom_app_2411/views/widgets/stuff_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Map<String, Color> cartType = {
  "wish list": Colors.amber,
  "in cart": Colors.blue,
  "in delivery": Colors.green,
  "purchase": Colors.black
};

class CartList extends StatefulWidget {
  final AppBloc appBloc;
  final List<Purchase> purchases;
  final String type;
  const CartList({
    super.key,
    required this.appBloc,
    required this.purchases,
    required this.type,
  });

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white, // Colors.purple,
        shadowColor: Colors.grey,
        bottom: bottomAppBar(
          context: context,
          purchases: widget.purchases,
        ),
        title: Row(
          children: [
            Text(
              widget.purchases.length.toString(), //numbers.toString(),
              style: GoogleFonts.comfortaa(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: cartType[widget.type],
              ),
            ),
            divineSpace(width: 10),
            Text(
              widget.type,
              style: GoogleFonts.comfortaa(
                  fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          genericTextButton(
              text: "Check Out",
              textColor: Colors.black,
              bgcolor: Colors.grey.shade200.withOpacity(0.5),
              colorTapped: Colors.pink,
              sized: 20,
              func: () {
                widget.appBloc.add(
                  CheckOutTappedEvent(
                    purchase: widget.purchases,
                  ),
                );
              },
              context: context),
          divineSpace(width: 10),
        ],
      ),
      body: Column(
        children: [
          // Container(
          //   child: Lottie.asset("lib/assets/deli.json"),
          // ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.purchases.length,
              itemBuilder: (context, index) {
                return cartTile(
                  context: context,
                  purchase: widget.purchases[index],
                  func: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

ListTile cartTile({
  required BuildContext context,
  required Purchase purchase,
  required Function() func,
}) {
  return ListTile(
    leading: SizedBox(
        height: 70,
        width: 70,
        child: Image.network(purchase.product.images.first)),
    title: Text(
      purchase.product.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.hind(
        fontSize: 16,
      ),
    ),
    subtitle: Text(
      purchase.price.toString(),
      style: GoogleFonts.hind(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    trailing: genericTextButton(
        text: "${purchase.amount}",
        textColor: Theme.of(context).colorScheme.onPrimary,
        bgcolor: Colors.grey,
        colorTapped: Theme.of(context).colorScheme.onBackground,
        sized: 30,
        func: () {},
        context: context),
  );
}
