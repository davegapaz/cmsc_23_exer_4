import 'package:flutter/material.dart';

class NameTextFieldSample extends StatefulWidget {
  final Function(String)? callback;
  final ValueChanged? onChanged;
  const NameTextFieldSample(this.callback, {super.key, this.onChanged});

  @override
  State<NameTextFieldSample> createState() => _NameTextFieldSampleState();
}

class _NameTextFieldSampleState extends State<NameTextFieldSample> {
  String inputValue = "";

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
          validator: (value) {
            if (inputValue == "") return "Please enter some text";
            return null;
          },
          onChanged: (value) {
            setState(() {
              inputValue = value;
              widget.onChanged?.call(value);
            });
            widget.callback!(inputValue);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Name "),
          )),
    ]);
  }
}
