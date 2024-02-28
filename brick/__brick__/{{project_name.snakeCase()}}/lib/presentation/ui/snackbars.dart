import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void showErrorSnackBar(
  BuildContext context, {
  String error = 'error.general',
  int duration = 3000,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(error.tr()),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.redAccent,
      ),
    );
}

void showSuccessSnackBar(
  BuildContext context, {
  String message = 'success.general',
  int duration = 3000,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message.tr()),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
      ),
    );
}
