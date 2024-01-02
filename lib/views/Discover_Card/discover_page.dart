import 'package:ecom_app_2411/bloc/app_bloc.dart';
import 'package:ecom_app_2411/bloc/app_bloc_event.dart';
import 'package:ecom_app_2411/bloc/app_bloc_state.dart';
import 'package:ecom_app_2411/repo/local_data.dart';
import 'package:ecom_app_2411/views/widgets/display_size.dart';
import 'package:ecom_app_2411/model/product_model.dart';
import 'package:ecom_app_2411/views/Discover_Card/widgets/discover_content.dart';
import 'package:ecom_app_2411/views/Discover_Card/filter_bar/filter_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class DiscoverPage extends StatefulWidget {
  final AppBloc appBloc;
  final Iterable<Product> data;
  const DiscoverPage({super.key, required this.data, required this.appBloc});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  late ScrollController controller;
  late List<String> items;

  @override
  void initState() {
    super.initState();
    items = widget.appBloc.items;
    controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    int restItems = widget.appBloc.dataInBloc.length - items.length;
    int restItemsFilter =
        widget.appBloc.dataInBlocFiltered.length - items.length;

    if (controller.position.extentAfter < 500 &&
        widget.appBloc.filterName == "everything" &&
        items.length <= widget.appBloc.dataInBloc.length) {
      if (restItems < 10) {
        setState(() {
          items.addAll(List.generate(restItems, (index) => ''));
        });
      } else {
        setState(() {
          items.addAll(List.generate(10, (index) => ''));
        });
      }
    } else if (controller.position.extentAfter < 500 &&
        widget.appBloc.filterName != "everything" &&
        items.length <= widget.appBloc.dataInBlocFiltered.length) {
      if (restItemsFilter < 10) {
        setState(() {
          items.addAll(List.generate(restItemsFilter, (index) => ''));
        });
      } else {
        setState(() {
          items.addAll(List.generate(10, (index) => ''));
        });
      }
    }
  }

  void _setStateButton({
    required ControlBarItem itemType,
    required int index,
    required bool isFavorited,
    required bool isSaved,
  }) {
    setState(() {
      switch (itemType) {
        case ControlBarItem.like:
          if (isFavorited) {
            favList.remove(widget.data.elementAt(index));
          } else {
            favList.add(widget.data.elementAt(index));
            widget.appBloc.add(
              ControlBarTappedEvent(
                item: widget.data.elementAt(index),
                itemType: itemType,
              ),
            );
          }

          isFavorited = !isFavorited;

        case ControlBarItem.save:
          if (isSaved) {
            saveList.remove(widget.data.elementAt(index));
          } else {
            saveList.add(widget.data.elementAt(index));
            widget.appBloc.add(
              ControlBarTappedEvent(
                item: widget.data.elementAt(index),
                itemType: itemType,
              ),
            );
          }

          isSaved = !isSaved;

        case ControlBarItem.cart:
        case ControlBarItem.share:
          widget.appBloc.add(
            ControlBarTappedEvent(
              item: widget.data.elementAt(index),
              itemType: itemType,
            ),
          );

        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.grey.shade200.withOpacity(0.5),
          surfaceTintColor: Theme.of(context).colorScheme.onPrimary,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark, // For iOS (dark icons)
          ),
          flexibleSpace: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: filterBar(
              context: context,
              list: filters,
              appBloc: widget.appBloc,
              controller: controller,
            ),
          ),
        ),
        body: SizedBox(
          height: displayHeight(context),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BlocConsumer(
                listener: (context, state) {},
                bloc: widget.appBloc,
                builder: (context, state) {
                  if (state is FilterTappedState) {
                    return Expanded(
                      child: Center(
                        child: LottieBuilder.asset(
                          "lib/assets/loadingpage.json",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          widget.appBloc.add(
                            FilterTappedEvent(
                              filterName: widget.appBloc.filterName,
                            ),
                          );
                        },
                        child: ListView.builder(
                          controller: controller,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            bool isFavorited = favList.contains(
                              widget.data.elementAt(index),
                            );
                            bool isSaved = saveList.contains(
                              widget.data.elementAt(index),
                            );

                            return InkWell(
                              splashFactory: NoSplash.splashFactory,
                              overlayColor: const MaterialStatePropertyAll(
                                  Colors.transparent),
                              onTap: () {
                                widget.appBloc.add(TapToItemEvent(
                                  product: widget.data.elementAt(index),
                                ));
                              },
                              child: discoverCard(
                                  context: context,
                                  product: widget.data.elementAt(index),
                                  isFavorited: isFavorited,
                                  isSaved: isSaved,
                                  func: (itemType) {
                                    _setStateButton(
                                      itemType: itemType,
                                      index: index,
                                      isFavorited: isFavorited,
                                      isSaved: isSaved,
                                    );
                                  }),
                            );
                          },
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
