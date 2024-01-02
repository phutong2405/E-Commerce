import 'package:ecom_app_2411/bloc/app_bloc.dart';
import 'package:ecom_app_2411/model/product_model.dart';
import 'package:ecom_app_2411/views/Detail_Screen/Down_part_content/widgets/option_area.dart';
import 'package:ecom_app_2411/views/widgets/stuff_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Map<String, Color> cartType = {
  "wish list": Colors.amber,
  "in delivery": Colors.green,
  "purchase": Colors.black
};

class OtherCartList extends StatefulWidget {
  final AppBloc appBloc;
  final List<Product> products;
  final String type;
  const OtherCartList({
    super.key,
    required this.appBloc,
    required this.products,
    required this.type,
  });

  @override
  State<OtherCartList> createState() => _OtherCartListState();
}

class _OtherCartListState extends State<OtherCartList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white, // Colors.purple,
        shadowColor: Colors.grey,

        title: Row(
          children: [
            Text(
              widget.products.length.toString(), //numbers.toString(),
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
        actions: widget.type == 'wish list'
            ? [
                genericTextButton(
                    text: "Check Out",
                    textColor: Colors.black,
                    bgcolor: Colors.grey.shade200.withOpacity(0.5),
                    colorTapped: Colors.pink,
                    sized: 20,
                    func: () {},
                    context: context),
                divineSpace(width: 10),
              ]
            : [],
      ),
      body: Column(
        children: [
          // Container(
          //   child: Lottie.asset("lib/assets/deli.json"),
          // ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.products.length,
              itemBuilder: (context, index) {
                return otherCartTile(
                  context: context,
                  product: widget.products[index],
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

ListTile otherCartTile({
  required BuildContext context,
  required Product product,
  required Function() func,
}) {
  return ListTile(
    leading: SizedBox(
        height: 70, width: 70, child: Image.network(product.images.first)),
    title: Text(
      product.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.hind(
        fontSize: 16,
      ),
    ),
    subtitle: Text(
      product.sellingPrice.toString(),
      style: GoogleFonts.hind(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    // trailing: genericTextButton(
    //     text: "${purchase.amount}",
    //     textColor: Theme.of(context).colorScheme.onPrimary,
    //     bgcolor: Colors.grey,
    //     colorTapped: Theme.of(context).colorScheme.onBackground,
    //     sized: 30,
    //     func: () {},
    //     context: context),
  );
}
