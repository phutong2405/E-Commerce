import 'package:ecom_app_2411/bloc/app_bloc.dart';
import 'package:ecom_app_2411/bloc/app_bloc_event.dart';
import 'package:ecom_app_2411/model/purchase_product.dart';
import 'package:ecom_app_2411/views/Cart_List/cart_list_view.dart';
import 'package:ecom_app_2411/views/widgets/display_size.dart';
import 'package:ecom_app_2411/views/Detail_Screen/Down_part_content/widgets/option_area.dart';
import 'package:ecom_app_2411/views/widgets/stuff_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutPage extends StatefulWidget {
  final AppBloc appBloc;
  final List<Purchase> purchases;
  const CheckOutPage(
      {super.key, required this.appBloc, required this.purchases});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white, // Colors.purple,
        shadowColor: Colors.grey,
        actions: [
          genericTextButton(
              text: "Place Orders",
              textColor: Colors.black,
              bgcolor: Colors.grey.shade200.withOpacity(1),
              colorTapped: Colors.pink,
              sized: 20,
              func: () {
                widget.appBloc.add(
                  PlaceOrdersTappedEvent(
                    purchases: widget.purchases,
                  ),
                );
              },
              context: context),
          divineSpace(width: 10),
        ],
        bottom: bottomAppBar(context: context, purchases: widget.purchases),
        title: Text(
          "Check Out",
          style: GoogleFonts.comfortaa(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.pink,
          ),
        ),
      ),
      body: Column(
        children: [
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

PreferredSizeWidget bottomAppBar({
  required BuildContext context,
  required List<Purchase> purchases,
}) {
  return PreferredSize(
    preferredSize: Size(displayWidth(context), 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Total | Amount : ",
          style: GoogleFonts.hind(fontSize: 18),
        ),
        Text(
          ("\$ ${purchases.fold(0, (previousValue, element) => previousValue + element.total.toInt())} "),
          style: GoogleFonts.hind(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black.withRed(150),
              fontStyle: FontStyle.italic),
        ),
        Text(
          ("| ${purchases.length} "),
          style: GoogleFonts.hind(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey,
              fontStyle: FontStyle.italic),
        ),
      ],
    ),
  );
}
