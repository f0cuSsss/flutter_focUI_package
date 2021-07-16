import 'package:flutter/material.dart';
import 'package:foc_ui/ui/f_text.dart';

// ignore: camel_case_types
class fCheckbox extends StatelessWidget {
  /// Text of checkbox
  final String title;

  /// State of checkbox
  final bool selected;

  /// Allow to check clicking on text
  final bool clickable;

  /// Color when checked
  final Color selectedColor;

  /// Check callback
  final void Function(bool?) checkHandler;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return selectedColor;
  }

  const fCheckbox({
    Key? key,
    required this.selected,
    required this.checkHandler,
    required this.title,
    required this.selectedColor,
    this.clickable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: selected,
          onChanged: checkHandler,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => clickable ? checkHandler(!selected) : () {},
            child: fText.bodyText2(title, context: context),
          ),
        ),
      ],
    );
  }
}
