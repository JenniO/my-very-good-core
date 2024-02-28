import 'package:flutter/material.dart';

extension ExtendedWidgetList on List<Widget> {
  /// Insert [widget] between each member of this list
  List<Widget> insertBetween(Widget widget) {
    if (this.length > 1) {
      for (var i = this.length - 1; i > 0; i--) this.insert(i, widget);
    }

    return this;
  }
}
