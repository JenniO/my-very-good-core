import 'package:flutter/material.dart';

class LoadingOverlay {
  static OverlayEntry? _overlay;

  static void start(
    BuildContext context, {
    Color barrierColor = Colors.black12,
    Color backgroundColor = Colors.black54,
    Color? indicatorColor,
    double? dimension,
  }) {
    if (_overlay != null) _overlay?.remove();
    _overlay = OverlayEntry(
      builder: (context) {
        return Container(
          constraints: const BoxConstraints.expand(),
          color: barrierColor,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: dimension ?? 120,
                height: dimension ?? 120,
                color: backgroundColor,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: indicatorColor,
                ),
              ),
            ),
          ),
        );
      },
    );
    Overlay.of(context).insert(_overlay!);
  }

  static void stop() {
    if (_overlay == null) return;
    _overlay?.remove();
    _overlay = null;
  }
}
