import 'package:flutter/material.dart';

/// A customizable loading indicator widget for Flutter applications.
class LoadingIndicator extends StatelessWidget {
  /// The diameter of the circular progress indicator.
  final double size;

  /// The color of the loading spinner.
  final Color? color;

  /// The width of the line used to draw the circular progress indicator.
  final double strokeWidth;

  /// An optional message displayed below the spinner.
  final String? message;

  /// Text style for the optional [message].
  final TextStyle? messageStyle;

  /// Space in logical pixels between the spinner and the [message].
  final double spacing;

  const LoadingIndicator({
    super.key,
    this.size = 40.0,
    this.color,
    this.strokeWidth = 4.0,
    this.message,
    this.messageStyle,
    this.spacing = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final indicatorColor = color ?? theme.colorScheme.primary;

    Widget indicator = SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
      ),
    );

    if (message != null && message!.isNotEmpty) {
      indicator = Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          indicator,
          SizedBox(height: spacing),
          Text(
            message!,
            style: messageStyle ?? theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      );
    }

    return indicator;
  }
}
