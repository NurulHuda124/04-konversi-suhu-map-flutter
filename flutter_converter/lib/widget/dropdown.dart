import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/services.dart';

class Dropdown extends StatelessWidget {
  const Dropdown(
      {Key? key,
      required this.listSatuanSuhu,
      required this.selectedDropdown,
      required this.onChangedDropdown})
      : super(key: key);

  final List<String> listSatuanSuhu;
  final String selectedDropdown;
  final Function(dynamic) onChangedDropdown;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        items: listSatuanSuhu.map(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          },
        ).toList(),
        value: selectedDropdown,
        onChanged: onChangedDropdown);
  }
}
