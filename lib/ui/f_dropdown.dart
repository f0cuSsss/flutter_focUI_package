import 'package:flutter/material.dart';
import 'package:foc_ui/foc_ui.dart';

// ignore: camel_case_types
class fDropdown extends StatelessWidget {
  /// Initial text without selected item
  final String placeholder;

  /// Selected item
  final fDropdownItem? selected;
// ignore: prefer_typing_uninitialized_variables
  /// List of dropdown items [fDropdownItem type item list]
  final List<fDropdownItem> items;

  /// Change callback
  final void Function(fDropdownItem)? onChanged;

  const fDropdown({
    Key? key,
    this.placeholder = 'Select',
    required this.selected,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<fDropdownItem>(
                  hint: fText.bodyText2(
                    selected == null ? placeholder : selected!.title.toString(),
                    context: context,
                  ),
                  value: selected,
                  underline: Container(),
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 20.0,
                  iconEnabledColor: Colors.black.withOpacity(0.6),
                  onChanged: (fDropdownItem? item) => onChanged!(item!),
                  items: items.map<DropdownMenuItem<fDropdownItem>>(
                      (fDropdownItem item) {
                    return DropdownMenuItem<fDropdownItem>(
                      value: item,
                      child: Row(
                        children: [
                          if (item.icon != null) item.icon!,
                          Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: fText.bodyText2(
                              item.title,
                              context: context,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
