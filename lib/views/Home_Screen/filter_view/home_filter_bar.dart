import 'package:ecom_app_2411/bloc/app_bloc.dart';
import 'package:ecom_app_2411/bloc/app_bloc_event.dart';
import 'package:ecom_app_2411/views/widgets/display_size.dart';
import 'package:ecom_app_2411/views/widgets/stuff_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget homeFilterBar({
  required BuildContext context,
  required List<String> list,
  required AppBloc appBloc,
  ScrollController? controller,
}) {
  return SizedBox(
    height: 46,
    width: displayWidth(context),
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        divineSpace(width: 5),
        IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.search)),
        divineSpace(width: 10),
        ...list.map(
          (e) => filterBarWidget(
            context: context,
            filterName: e,
            isSelectedName: appBloc.filterName,
            appBloc: appBloc,
          ),
        ),
      ],
    ),
  );
}

Widget filterBarWidget({
  required BuildContext context,
  required String filterName,
  required String isSelectedName,
  required AppBloc appBloc,
}) {
  bool isSelected = isSelectedName == filterName;
  return InkWell(
    splashFactory: NoSplash.splashFactory,
    overlayColor: const MaterialStatePropertyAll(Colors.transparent),
    onTap: () {
      appBloc.add(
        FilterTappedEvent(filterName: filterName),
      );
    },
    child: Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10),
      height: 60,
      decoration: BoxDecoration(
          border: !isSelected
              ? Border.all(width: 2, color: Colors.blueGrey)
              : Border.all(width: 2, color: Colors.amber),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          gradient: const LinearGradient(colors: [
            Colors.pink,
            Colors.purple,
            Colors.blue,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Text(
        filterName,
        style: GoogleFonts.hind(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
