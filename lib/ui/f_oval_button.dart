import 'package:flutter/material.dart';
import 'package:foc_ui/foc_ui.dart';

// ignore: camel_case_types
class fOvalButton extends StatelessWidget {
  /// Button text
  final String? title;

  /// Icon
  final Widget? icon;

  /// Circle button size
  final double size;

  /// Background color
  final Color color;

  /// Text style
  final TextStyle? textStyle;

  /// Button click callback
  final void Function() onTapped;

  /// Button long press
  final void Function()? onLongPress;

  const fOvalButton({
    Key? key,
    this.title,
    this.icon,
    this.size = 56,
    this.textStyle,
    this.color = kAccent,
    required this.onTapped,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(size, size),
      child: ClipOval(
        child: Material(
          color: color,
          child: InkWell(
            splashColor: fGetDarkenColor(color),
            onTap: onTapped,
            onLongPress: onLongPress,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (icon != null) icon!,
                if (title != null)
                  textStyle == null
                      ? fText.button(title!, context: context)
                      : fText.buttonStyled(title!, textStyle, context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
