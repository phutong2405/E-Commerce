import 'package:ecom_app_2411/controller/loading_controller.dart';
import 'package:ecom_app_2411/views/widgets/display_size.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen {
  LoadingScreen._sharedInstance();
  static final LoadingScreen _shared = LoadingScreen._sharedInstance();
  factory LoadingScreen.instance() => _shared;

  LoadingController? controller;

  void show({
    required BuildContext context,
    required String text,
  }) {
    if (controller?.updateOptions(text) ?? false) {
      return;
    } else {
      controller = showOverlay(
        context: context,
        text: text,
      );
    }
  }

  void hide() {
    controller?.closeOptions();
    controller = null;
  }

  LoadingController showOverlay({
    required BuildContext context,
    required String text,
  }) {
    final overlayState = Overlay.of(context);
    final overlay = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              top: displayHeight(context) * 0.3,
              left: displayWidth(context) * 0.13,
              child: Container(
                height: 300,
                width: 300,
                alignment: Alignment.bottomCenter,
                // decoration: BoxDecoration(
                //   // color: Colors.grey.shade200.withOpacity(0.6),
                //   gradient: LinearGradient(
                //     colors: [
                //       Colors.black,
                //       Colors.black,
                //       Colors.black54,
                //       Colors.grey,
                //       Colors.grey.shade200.withOpacity(0.3),
                //       Colors.grey.shade200.withOpacity(0.1)
                //     ],
                //     begin: Alignment.topCenter,
                //     end: Alignment.bottomCenter,
                //   ),
                //   // color: Colors.black,
                //   borderRadius: BorderRadius.circular(20.0),
                // ),
                child: Lottie.asset(
                  "lib/assets/$text.json",
                  animate: true,
                  filterQuality: FilterQuality.high,
                  repeat: true,
                  fit: BoxFit.fitHeight,
                  height: 300,
                  width: 300,
                ),
              ),
            )
          ],
        );
      },
    );

    overlayState.insert(overlay);

    return LoadingController(
      closeOptions: () {
        overlay.remove();
        return true;
      },
      updateOptions: (text) {
        return true;
      },
    );
  }
}
