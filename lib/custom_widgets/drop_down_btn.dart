import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
class DropDownBtn extends StatelessWidget {
  final List<String> list;
  final String selectedProductItems;
  final Function(String?) Onselected;
  const DropDownBtn({super.key, required this.list,required this.selectedProductItems,required this.Onselected});

  @override
  Widget build(BuildContext context) {
    String ? Selecteditem;
    return Card(
      elevation: 8,
      child: Center(
          child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
          selectedProductItems,
          style: TextStyle(
          fontSize: 14,
          color: Theme.of(context).hintColor,
      ),
      ),
      items: list
          .map((String item) => DropdownMenuItem<String>(
      value: item,
      child: Text(
      item,
      style: const TextStyle(
      fontSize: 14,
      ),
      ),
      ))
          .toList(),
      value: Selecteditem,
      onChanged: (String? value) {
      Onselected(value);
      },
      buttonStyleData:  ButtonStyleData(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 40,
      width: 140,
      ),
      menuItemStyleData:  MenuItemStyleData(
      height: 40,
      ),
      ),
      ),
      ),
    );
  }
}
