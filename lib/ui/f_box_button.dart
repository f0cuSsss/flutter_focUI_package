import 'package:flutter/material.dart';
import 'package:foc_ui/foc_ui.dart';

// ignore: camel_case_types
class fBoxButton extends StatelessWidget {
  /// Inner button text
  final String title;

  /// Set 'true' if you want to make button disable [default: false]
  final bool disabled;

  /// Sets transparent background [default: false]
  final bool isTransparent;

  /// Border radius of button
  final double borderRadius;

  /// Button height
  final double height;

  /// Elevation
  final double elevation;

  /// Outline width
  final double outlineWidth;

  final Widget? leadingIcon;

  /// Trailing icon
  final Widget? trailingIcon;

  /// Background button color
  final Color color;

  /// Outline border color
  final Color? outlineColor;

  /// Text style
  final TextStyle? textStyle;

  /// Sets focus to button
  final FocusNode? focusNode;

  /// Button click callback
  final void Function()? onTapped;

  const fBoxButton({
    Key? key,
    required this.title,
    required this.onTapped,
    this.disabled = false,
    this.isTransparent = false,
    this.color = kAccent,
    this.textStyle,
    this.focusNode,
    this.outlineColor,
    this.borderRadius = 8.0,
    this.height = 52.0,
    this.elevation = 10.0,
    this.outlineWidth = 1.0,
    this.leadingIcon,
    this.trailingIcon,
  }) : super(key: key);

  const fBoxButton.outline({
    Key? key,
    required this.title,
    required this.onTapped,
    this.disabled = false,
    required this.isTransparent,
    this.color = kAccent,
    required this.textStyle,
    this.focusNode,
    required this.outlineColor,
    this.borderRadius = 8.0,
    this.height = 55.0,
    this.elevation = 10.0,
    this.outlineWidth = 1.0,
    this.leadingIcon,
    this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color eColor = isTransparent
        ? Colors.transparent
        : disabled
            ? color.withOpacity(0.35)
            : color;
    Color? splashColor = isTransparent
        ? color.withOpacity(0.2)
        : disabled
            ? null
            : fGetDarkenColor(color, 0.05);
    BorderRadius radius = BorderRadius.circular(borderRadius);
    return Material(
      elevation: isTransparent ? 0 : elevation,
      borderRadius: radius,
      color: eColor,
      child: InkWell(
        onTap: disabled ? null : onTapped,
        splashColor: splashColor,
        focusNode: focusNode,
        borderRadius: radius,
        child: Container(
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: outlineColor == null ? Colors.transparent : outlineColor!,
              width: outlineWidth,
            ),
            borderRadius: radius,
          ),
          // child: textStyle == null
          //     ? fText.button(title, context: context)
          //     : fText.buttonStyled(
          //         title,
          //         textStyle,
          //         context: context,
          //       ),
          child: Row(
            children: [
              if (leadingIcon != null) Expanded(flex: 2, child: leadingIcon!),
              Expanded(
                flex: 10,
                child: textStyle == null
                    ? Center(child: fText.button(title, context: context))
                    : Center(
                        child: fText.buttonStyled(
                          title,
                          textStyle,
                          context: context,
                        ),
                      ),
              ),
              if (trailingIcon != null) Expanded(flex: 2, child: trailingIcon!),
            ],
          ),
        ),
      ),
    );
  }
}
