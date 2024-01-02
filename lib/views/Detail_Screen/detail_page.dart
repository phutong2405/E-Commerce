import 'package:ecom_app_2411/bloc/app_bloc.dart';
import 'package:ecom_app_2411/bloc/app_bloc_event.dart';
import 'package:ecom_app_2411/repo/local_data.dart';
import 'package:ecom_app_2411/views/widgets/display_size.dart';
import 'package:ecom_app_2411/model/product_model.dart';
import 'package:ecom_app_2411/views/Detail_Screen/Down_part_content/detail_down_content.dart';
import 'package:ecom_app_2411/views/Detail_Screen/Upper_part_content/widgets/detail_content.dart';
import 'package:ecom_app_2411/views/Detail_Screen/Upper_part_content/detail_upper_content.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final AppBloc appBloc;
  final Product product;
  const DetailPage({
    super.key,
    required this.appBloc,
    required this.product,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  void _setStateButton({
    required ControlBarItem itemType,
    required bool isFavorited,
    required bool isSaved,
  }) {
    setState(() {
      switch (itemType) {
        case ControlBarItem.like:
          if (isFavorited) {
            favList.remove(widget.product);
          } else {
            favList.add(widget.product);
            widget.appBloc.add(
              ControlBarTappedEvent(
                item: widget.product,
                itemType: itemType,
              ),
            );
          }

          isFavorited = !isFavorited;

        case ControlBarItem.save:
          if (isSaved) {
            saveList.remove(widget.product);
          } else {
            saveList.add(widget.product);
            widget.appBloc.add(
              ControlBarTappedEvent(
                item: widget.product,
                itemType: itemType,
              ),
            );
          }
          isSaved = !isSaved;

        case ControlBarItem.cart:
        case ControlBarItem.share:
          widget.appBloc.add(
            ControlBarTappedEvent(
              item: widget.product,
              itemType: itemType,
            ),
          );

        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isFavorited = favList.contains(widget.product);
    bool isSaved = saveList.contains(widget.product);
    return Material(
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///UPPER PART
                  detailUpperContent(context: context, product: widget.product),

                  const Spacer(),

                  ///DOWN PART
                  detailDownContent(
                    context: context,
                    product: widget.product,
                    appBloc: widget.appBloc,
                    func: (controlBarItem) {
                      _setStateButton(
                          itemType: controlBarItem,
                          isFavorited: isFavorited,
                          isSaved: isSaved);
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              top: 50,
              child: SizedBox(
                height: displayHeight(context) * 0.532,
                width: displayWidth(context),
                child: detailInforContent(
                    context: context, product: widget.product),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
