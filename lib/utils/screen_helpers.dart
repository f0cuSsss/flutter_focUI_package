import 'package:flutter/widgets.dart';

/* 
===================================================
================= Screen helpers ==================
=================================================== 
*/
/// Returns width of device screen
double fGetScreenWidth(BuildContext context) =>
    MediaQuery.of(context).size.width;

/// Returns height of device screen
double fGetScreenHeight(BuildContext context) =>
    MediaQuery.of(context).size.height;

/// Returns width that calculated as percentage of the device screen width
double fGetPercentWidth(BuildContext context, {double percentage = 1}) =>
    (fGetScreenWidth(context) * percentage) / 100;

/// Returns height that calculated as percentage of the device screen height
double fGetPercentHeight(BuildContext context, {double percentage = 1}) =>
    (fGetScreenHeight(context) * percentage) / 100;
