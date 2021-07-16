import 'package:flutter/material.dart';
import 'package:foc_ui/foc_ui.dart';

// ignore: camel_case_types
class fChipButton extends StatelessWidget {
  /// Main chip text
  final String title;

  /// State of the chip
  final bool isSelected;

  /// Accent color of chip
  final Color color;

  /// Elevation of chip
  final double elevation;

  final void Function(bool) onSelect;

  const fChipButton({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onSelect,
    this.color = Colors.deepPurpleAccent,
    this.elevation = 0,
  })  : assert(title.length <= 15, 'Title should be less then 15 symbols'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.circular(25.0);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Material(
        elevation: elevation,
        shadowColor: color,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: () => onSelect(!isSelected),
          borderRadius: borderRadius,
          splashColor: Colors.transparent,
          highlightColor: color.withOpacity(0.5),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: double.infinity,
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected
                    ? color
                    // : Colors.transparent,
                    : color.withOpacity(0.1),
                width: 2,
              ),
              color: Colors.transparent,
              borderRadius: borderRadius,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                fText.subtitle1(title, context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
