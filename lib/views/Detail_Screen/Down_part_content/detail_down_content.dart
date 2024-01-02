import 'package:ecom_app_2411/bloc/app_bloc.dart';
import 'package:ecom_app_2411/bloc/app_bloc_event.dart';
import 'package:ecom_app_2411/views/widgets/display_size.dart';
import 'package:ecom_app_2411/model/product_model.dart';
import 'package:ecom_app_2411/views/Detail_Screen/Down_part_content/widgets/control_area.dart';
import 'package:ecom_app_2411/views/Detail_Screen/Down_part_content/widgets/option_area.dart';
import 'package:ecom_app_2411/views/widgets/stuff_view.dart';
import 'package:flutter/material.dart';

Widget detailDownContent({
  required BuildContext context,
  required Product product,
  required AppBloc appBloc,
  required Function(ControlBarItem controlBarItem) func,
}) {
  return Container(
    padding: const EdgeInsets.only(left: 2),
    width: displayWidth(context),
    height: displayHeight(context) - (displayHeight(context) * 0.7),
    // color: Colors.blue,
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///LEFT_HANDED CONTROL BAR
            detailPageControlBar(
              context: context,
              product: product,
              func: (controlBarItem) {
                func(controlBarItem);
              },
            ),
            divineSpace(width: 5),

            ///RIGHT OPTION AREA
            detailOptionArea(
              context: context,
              product: product,
              amountFunc: () {},
              couponsFunc: () {},
            ),
          ],
        ),

        ///BOTTOM CONTROL BAR
        detailBottomButton(
          context: context,
          appBloc: appBloc,
          product: product,
        ),
      ],
    ),
  );
}
