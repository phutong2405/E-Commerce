import 'dart:async';
import 'package:ecom_app_2411/bloc/app_bloc.dart';
import 'package:ecom_app_2411/bloc/app_bloc_event.dart';
import 'package:ecom_app_2411/bloc/app_bloc_state.dart';
import 'package:ecom_app_2411/model/product_model.dart';
import 'package:ecom_app_2411/repo/local_data.dart';
import 'package:ecom_app_2411/views/Cart_List/cart_list_view.dart';
import 'package:ecom_app_2411/views/Cart_List/other_list.dart';
import 'package:ecom_app_2411/views/Cart_Screen/cart_page.dart';
import 'package:ecom_app_2411/views/Check_Out_Screen/check_out_view.dart';
import 'package:ecom_app_2411/views/Detail_Screen/detail_page.dart';
import 'package:ecom_app_2411/views/Home_Screen/home_view.dart';
import 'package:ecom_app_2411/views/Discover_Card/discover_page.dart';
import 'package:ecom_app_2411/views/Video_Screen/video_view.dart';
import 'package:ecom_app_2411/views/widgets/bottom_navigation_bar.dart';
import 'package:ecom_app_2411/views/overlays/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late AppBloc appBloc;
  late final Iterable<Product> data;
  @override
  void initState() {
    super.initState();
    appBloc = AppBloc();
    appBloc.add(const InitialEvent());
  }

  int _selectedPage = 0;

  _changeTab(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  Widget getPage({required Iterable<Product> data, required int index}) {
    List pages = [
      DiscoverPage(
        appBloc: appBloc,
        data: data,
      ),
      HomePage(
        appBloc: appBloc,
        data: appBloc.dataInBloc,
      ),
      const VideoScreen(),
      CartPage(appBloc: appBloc),
    ];
    return pages[index];
  }

  Widget mainView({required Iterable<Product> data, required Widget body}) {
    return Scaffold(
        body: body,
        bottomNavigationBar: bottomNavigationBar(
            context: context, selectedPage: _selectedPage, func: _changeTab));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: appBloc,
      listenWhen: (previous, current) =>
          current is MainActionState ||
          current is ControlBarTappedState ||
          current is PlaceOrdersTappedState,
      buildWhen: (previous, current) => current is! MainActionState,
      listener: (context, state) {
        if (state is TapToItemState) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(
              product: state.product,
              appBloc: appBloc,
            ),
          ));
        }
        if (state is ControlBarTappedState) {
          Timer t = Timer(const Duration(seconds: 0), () {});
          t.cancel();
          LoadingScreen.instance().show(
            context: context,
            text: state.animateIconString,
          );
          t = Timer(state.duration, () {
            LoadingScreen.instance().hide();
          });
        }
        if (state is CartDetailTappedState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartList(
                appBloc: appBloc,
                purchases: state.purchase,
                type: state.type,
              ),
            ),
          );
        }
        if (state is OtherDetailTappedState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtherCartList(
                appBloc: appBloc,
                products: state.products,
                type: state.type,
              ),
            ),
          );
        }
        if (state is CheckOutTappedState) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CheckOutPage(
                      appBloc: appBloc,
                      purchases: state.purchase,
                    )),
          );
        }
        if (state is PlaceOrdersTappedState) {
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoadedState:
            state as LoadedState;
            final data = state.data;
            return mainView(
              data: data,
              body: getPage(data: data, index: _selectedPage),
            );

          case LoadingState:
            return Material(
              child: Center(
                child: Lottie.asset("lib/assets/loadingtext.json"),
              ),
            );

          case ErrorState:
            return mainView(
                data: [],
                body: const Center(
                  child: Text("ERROR"),
                ));

          default:
            return mainView(
                data: [],
                body: const Center(
                  child: Text("Errorrrr"),
                ));
        }
      },
    );
  }
}
