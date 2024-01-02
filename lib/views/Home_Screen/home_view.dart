import 'package:ecom_app_2411/bloc/app_bloc.dart';
import 'package:ecom_app_2411/bloc/app_bloc_event.dart';
import 'package:ecom_app_2411/model/product_model.dart';
import 'package:ecom_app_2411/views/Detail_Screen/detail_page.dart';
import 'package:ecom_app_2411/views/Home_Screen/widgets/exploring_view.dart';
import 'package:ecom_app_2411/views/Home_Screen/filter_view/home_filter_bar.dart';
import 'package:ecom_app_2411/views/Home_Screen/widgets/hotdeals_view.dart';
import 'package:ecom_app_2411/views/Home_Screen/widgets/zone_view.dart';
import 'package:ecom_app_2411/views/Discover_Card/filter_bar/filter_bar_view.dart';
import 'package:ecom_app_2411/views/widgets/stuff_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final AppBloc appBloc;
  final Iterable<Product> data;
  const HomePage({
    super.key,
    required this.appBloc,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverPersistentHeader(
          //   delegate: FlexibleHeaderDelegate(
          //     backgroundColor: Colors.transparent,
          //     statusBarHeight: MediaQuery.of(context).padding.top,
          //     expandedHeight: 180,
          //     background: MutableBackground(
          //       expandedWidget: Lottie.asset("lib/assets/universe.json",
          //           animate: true, repeat: true, fit: BoxFit.cover),
          //       collapsedColor: Colors.transparent,
          //     ),
          //     expandedElevation: 10,
          //     collapsedHeight: 10,
          //     collapsedElevation: 0,
          //     actions: [
          //       IconButton(
          //         icon: const Icon(
          //           Icons.search,
          //           color: Colors.white,
          //           size: 30,
          //         ),
          //         onPressed: () {},
          //       ),
          //     ],
          //     children: [
          //       FlexibleTextItem(
          //         text: "Logz Universe",
          //         collapsedStyle: GoogleFonts.spaceGrotesk(
          //           fontSize: 28,
          //           fontWeight: FontWeight.w500,
          //           color: Theme.of(context).colorScheme.onBackground,
          //         ),
          //         expandedStyle: GoogleFonts.spaceGrotesk(
          //             fontSize: 28,
          //             fontWeight: FontWeight.w600,
          //             color: Colors.white),
          //         expandedAlignment: Alignment.bottomLeft,
          //         collapsedAlignment: Alignment.center,
          //         expandedPadding:
          //             const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          //       ),
          //     ],
          //   ),
          // ),
          SliverAppBar(
            shadowColor: Colors.blueGrey.withOpacity(0.5),
            title: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: "Universe",
                    style: GoogleFonts.comfortaa(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                  TextSpan(
                    text: ' Logz',
                    style: GoogleFonts.spaceGrotesk(
                        fontSize: 26, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            elevation: 0,
            toolbarHeight: 100,
            centerTitle: false,
            pinned: true,
            surfaceTintColor: Theme.of(context).colorScheme.onPrimary,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    homeFilterBar(
                      context: context,
                      list: filters,
                      appBloc: appBloc,
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate([
              // divineSpace(height: 40),
              zoneSpaceHomeContent(
                  context: context, isFilter: false, list: zoneCats),

              divineSpace(height: 20),
              hotDealSpaceHomeContent(
                context: context,
                products: data,
                appBloc: appBloc,
              ),
              divineSpace(height: 20),
              exploringSpaceHomeContent(
                context: context,
                data: data,
                func: (product) {
                  appBloc.add(
                    TapToItemEvent(product: product),
                  );
                },
              ),
              divineLine(
                  colors: [Colors.grey, Colors.grey],
                  space: 0,
                  spaceBot: 0,
                  spaceTop: 15,
                  size: 0.3,
                  start: Alignment.centerLeft),
            ]),
          ),
          // SliverList(
          //     delegate: SliverChildListDelegate([
          //   productListSpace(context: context),
          // ]))
        ],
      ),
    );
  }
}
