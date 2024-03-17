import 'package:flutter/material.dart';
import 'package:my_app/nametextfield.dart';

class AgeTextField extends StatefulWidget {
  final Function(String)? callback;
  final ValueChanged? onChanged;
  const AgeTextField(this.callback, {super.key, this.onChanged});

  @override
  State<AgeTextField> createState() => _AgeTextFieldState();
}

class _AgeTextFieldState extends State<AgeTextField> {
  String inputValue = "";
  // static String strAge = "";

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
          validator: (value) {
            if (inputValue == "" || int.tryParse(value!) == null)
              return "Please enter ...";
            return null;
          },
          onChanged: (value) {
            setState(() {
              inputValue = value;
              widget.onChanged?.call(value);
              // strAge = "Age: ";
            });
            widget.callback!(inputValue);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Age "),
          )),
    ]);
  }
}
