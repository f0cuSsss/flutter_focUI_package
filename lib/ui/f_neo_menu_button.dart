import 'package:flutter/material.dart';
import 'package:foc_ui/foc_ui.dart';

// ignore: camel_case_types
class fNeoMenuButton extends StatelessWidget {
  /// Button text
  final String title;

  /// Leading icon
  final Widget icon;

  /// Button width [default: 220.0]
  final double width;

  /// Button height [default: 60.0]
  final double height;

  /// Border radius [default: 8.0]
  final double borderRadius;

  /// Background color of the icon
  final Color iconBackgroundColor;

  /// Button click callback
  final void Function() onTapped;

  const fNeoMenuButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.iconBackgroundColor,
    required this.onTapped,
    this.width = 220.0,
    this.height = 60.0,
    this.borderRadius = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.circular(this.borderRadius);

    return Material(
      elevation: 10,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTapped,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
          ),
          child: Row(
            children: <Widget>[
              LayoutBuilder(builder: (context, constraints) {
                return Container(
                  height: constraints.maxHeight,
                  width: constraints.maxHeight,
                  decoration: BoxDecoration(
                    color: iconBackgroundColor,
                    borderRadius: borderRadius,
                  ),
                  child: icon,
                );
              }),
              Expanded(
                child: fText.buttonStyled(
                    title,
                    const TextStyle(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                    context: context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
