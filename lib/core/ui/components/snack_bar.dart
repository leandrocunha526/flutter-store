import 'package:corelab_app_challenge/core/ui/app_theme/app_colors.dart';
import 'package:flutter/material.dart';

// Evitar confusão com a variável snackBar vou chamar de showSnackBar.
void showSnackBar({
  required BuildContext context,
  required String message,
}) {
  final snackBar = SnackBar(
    backgroundColor: AppColors.defaultCyan,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    elevation: 0,
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    content: Text(
      message,
    ),
  );
  ScaffoldMessenger.of(context)
      .showSnackBar(snackBar)
      .closed
      .then((value) => ScaffoldMessenger.of(context).clearSnackBars());
}
