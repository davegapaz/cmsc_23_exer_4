import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  static Widget getSuperpowers() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_DropdownState.strValue,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(_DropdownState.currentValue.toString(),
                style: TextStyle(fontSize: 15)),
          ],
        ));
  }

  static setOpt(String opt) {
    _DropdownState.currentValue = opt;
  }

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  static final List<String> _dropdownOptions = [
    "Makalipad",
    "Maging Invisible",
    "Mapaibig siya",
    "Mapabago ang isip niya",
    "Mapalimot siya",
    "Mabalik ang nakaraan",
    "Mapaghiwalay sila",
    "Makarma siya",
    "Mapasagasaan siya sa pison",
    "Mapaitim ang tuhod ng iniibig niya"
  ];

  static String currentValue = _dropdownOptions[0];
  static String strValue = "";
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: _dropdownOptions.map((dropdownChoice) {
        return DropdownMenuItem(
            value: dropdownChoice, child: Text(dropdownChoice));
      }).toList(),
      onChanged: (value) {
        setState(() {
          currentValue = value!;
          strValue = "Superpowers: ";
        });
      },
      value: currentValue,
    );
  }
}
