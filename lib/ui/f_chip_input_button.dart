import 'package:flutter/material.dart';
import 'package:foc_ui/foc_ui.dart';

// ignore: camel_case_types, must_be_immutable
class fChipInputButton extends StatelessWidget {
  /// Is selected value
  bool isSelected;

  /// Chip title
  final String title;

  /// Background color of chip
  final Color background;

  /// Background color of selected chip
  final Color selectedBackground;

  /// Use avatar
  final bool withAvatar;

  /// Background color of avatar
  final Color? avatarBackgroundColor;

  /// Text of avatar
  final String? avatarText;

  /// Select callback
  final void Function(bool) onSelect;

  fChipInputButton({
    Key? key,
    required this.isSelected,
    this.background = Colors.black12,
    this.withAvatar = false,
    this.avatarBackgroundColor,
    this.avatarText,
    required this.title,
    required this.onSelect,
    this.selectedBackground = Colors.lightGreen,
  }) : super(key: key);

  fChipInputButton.withAvatar({
    Key? key,
    required this.isSelected,
    this.withAvatar = true,
    required this.avatarBackgroundColor,
    required this.avatarText,
    this.background = Colors.black12,
    required this.title,
    required this.onSelect,
    this.selectedBackground = Colors.lightGreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputChip(
      padding: const EdgeInsets.all(2.0),
      backgroundColor: background,
      avatar: withAvatar
          ? CircleAvatar(
              backgroundColor: avatarBackgroundColor,
              child: fText.subtitle1(avatarText!, context: context),
            )
          : null,
      label: Text(
        title,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
      selected: isSelected,
      selectedColor: selectedBackground,
      onSelected: (bool selected) => onSelect(selected),
      onDeleted: null,
    );
  }
}
