import 'package:flutter/material.dart';
import 'loading_indicator.dart';

/// A utility class and widget to display popup loading dialogs.
class PopupLoading {
  static bool _isShowing = false;

  /// Whether a loading popup is currently visible.
  static bool get isShowing => _isShowing;

  /// Shows a modal popup loading dialog.
  ///
  /// - [context]: The BuildContext to display the dialog.
  /// - [message]: An optional text message to display under the spinner.
  /// - [barrierDismissible]: Whether tapping outside dismisses the popup (default: false).
  /// - [barrierColor]: The background barrier color (default: Colors.black54).
  /// - [backgroundColor]: The background color of the popup card.
  /// - [indicatorColor]: The color of the loading indicator spinner.
  /// - [size]: The size of the loading indicator spinner (default: 40.0).
  /// - [borderRadius]: Corner radius of the popup card (default: 16.0).
  static Future<void> show(
    BuildContext context, {
    String? message,
    bool barrierDismissible = false,
    Color barrierColor = Colors.black54,
    Color? backgroundColor,
    Color? indicatorColor,
    double size = 40.0,
    double borderRadius = 16.0,
  }) async {
    if (_isShowing) return;
    _isShowing = true;

    await showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      useRootNavigator: true,
      builder: (BuildContext dialogContext) {
        return PopScope(
          canPop: barrierDismissible,
          child: Center(
            child: Dialog(
              elevation: 4.0,
              backgroundColor: backgroundColor ??
                  Theme.of(dialogContext).colorScheme.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 32.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LoadingIndicator(
                      size: size,
                      color: indicatorColor,
                      message: message,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ).whenComplete(() {
      _isShowing = false;
    });
  }

  /// Closes the currently displayed popup loading dialog if visible.
  static void hide(BuildContext context) {
    if (_isShowing) {
      _isShowing = false;
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
