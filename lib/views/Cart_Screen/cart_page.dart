import 'package:ecom_app_2411/bloc/app_bloc.dart';
import 'package:ecom_app_2411/bloc/app_bloc_event.dart';
import 'package:ecom_app_2411/model/product_model.dart';
import 'package:ecom_app_2411/model/purchase_product.dart';
import 'package:ecom_app_2411/repo/local_data.dart';
import 'package:ecom_app_2411/views/Detail_Screen/Down_part_content/widgets/option_area.dart';
import 'package:ecom_app_2411/views/login_register/login_view.dart';
import 'package:ecom_app_2411/views/widgets/display_size.dart';
import 'package:ecom_app_2411/views/widgets/stuff_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  final AppBloc appBloc;
  const CartPage({super.key, required this.appBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: cartAppBar(context),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            cartStatus(
              context: context,
              numbers: LocalData.instance()
                  .getData(
                    dataType: LocalDataType.purchase,
                  )
                  .length,
              kind: "purchase",
              color: Colors.black,
              func: () {
                appBloc.add(
                  OtherDetailTappedEvent(
                      products: LocalData.instance().getProgressProduct(),
                      type: "purchase"),
                );
              },
            ),
            divineLine(
              colors: [Colors.transparent, Colors.grey, Colors.transparent],
              space: 5,
              start: Alignment.centerLeft,
              size: 0.2,
            ),
            cartStatus(
              context: context,
              numbers: LocalData.instance()
                  .getProgressProduct(progress: Progress.inDelivery)
                  .length,
              kind: "in delivery",
              color: Colors.green,
              func: () {
                appBloc.add(
                  OtherDetailTappedEvent(
                      products: LocalData.instance()
                          .getProgressProduct(progress: Progress.inDelivery),
                      type: "in delivery"),
                );
              },
            ),
            cartStatus(
              context: context,
              numbers: LocalData.instance()
                  .getData(
                    dataType: LocalDataType.savedProducts,
                  )
                  .length,
              kind: "saved",
              color: Colors.amber,
              func: () {
                appBloc.add(
                  OtherDetailTappedEvent(
                      products: LocalData.instance().getData(
                        dataType: LocalDataType.savedProducts,
                      ),
                      type: "wish list"),
                );
              },
            ),
            divineLine(
              colors: [Colors.transparent, Colors.grey, Colors.transparent],
              space: 5,
              start: Alignment.centerLeft,
              size: 0.2,
            ),
            cartStatus(
              context: context,
              numbers: LocalData.instance()
                  .getProgressPurchase(progress: Progress.inCart)
                  .length,
              kind: "in cart",
              color: Colors.blue,
              func: () {
                print(
                  LocalData.instance()
                      .getProgressPurchase(progress: Progress.inCart),
                );
                appBloc.add(
                  CartDetailTappedEvent(
                      purchases: LocalData.instance()
                          .getProgressPurchase(progress: Progress.inCart),
                      type: "in cart"),
                );
              },
            ),
            divineSpace(height: 0),
            const Spacer(),
            accountView(context: context),
            cartBottomButton(context: context, appBloc: appBloc),
            divineSpace(height: 5),
          ],
        ));
  }
}

Widget accountView({required BuildContext context}) {
  return ListTile(
    leading: CircleAvatar(backgroundColor: Colors.amber),
    title: Text("Phu Tong"),
    subtitle: Text("phutong2405@gmail.com"),
    trailing: IconButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ));
        },
        icon: Icon(
          Icons.logout_outlined,
          color: Colors.black.withRed(200),
        )),
  );
}

PreferredSizeWidget cartAppBar(BuildContext context) {
  return AppBar(
      toolbarHeight: 40,
      centerTitle: false,
      title: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: "Cart",
              style: GoogleFonts.comfortaa(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
            TextSpan(
              text: ' Logz',
              style: GoogleFonts.spaceGrotesk(
                  fontSize: 26, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.at,
            size: 24,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.gear,
            size: 24,
          ),
        )
      ]);
}

Widget cartStatus(
    {required BuildContext context,
    required int numbers,
    required String kind,
    required Color color,
    required Function() func}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
        padding: const EdgeInsets.only(left: 15, top: 10),
        child: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: numbers.toString(),
                style: GoogleFonts.comfortaa(
                    fontSize: 40, fontWeight: FontWeight.bold, color: color),
              ),
              TextSpan(
                text: ' $kind',
                style: GoogleFonts.comfortaa(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      const Spacer(),
      IconButton(
        onPressed: () {
          func();
        },
        icon: const Icon(CupertinoIcons.arrow_right),
      ),
      divineSpace(width: 47),
    ],
  );
}

Widget cartBottomButton({
  required BuildContext context,
  required AppBloc appBloc,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      genericTextIconButton(
        icon: CupertinoIcons.map,
        text: "Address",
        textColor: Theme.of(context).colorScheme.onPrimary,
        bgcolor: Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
        colorTapped: Colors.greenAccent,
        sized: 25,
        func: () {},
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
          appBloc.add(
            CheckOutTappedEvent(
              purchase: LocalData.instance()
                  .getProgressPurchase(progress: Progress.inCart),
            ),
          );
        },
      ),
      divineSpace(width: 10),
      genericTextIconButton(
        icon: CupertinoIcons.chat_bubble_2_fill,
        text: "Chat",
        textColor: Theme.of(context).colorScheme.onPrimary,
        bgcolor: Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
        colorTapped: Colors.amber,
        sized: 25,
        func: () {},
      ),
    ],
  );
}
