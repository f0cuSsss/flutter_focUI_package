// ignore: file_names
import 'package:flutter/material.dart';

// ignore: camel_case_types
class fDropdownItem {
  final int id;
  final String title;
  final Widget? icon;

  fDropdownItem({
    required this.id,
    required this.title,
    this.icon,
  });

  fDropdownItem.icon({
    required this.id,
    required this.title,
    required this.icon,
  });
}
