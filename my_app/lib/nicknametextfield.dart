import 'package:flutter/material.dart';

class NicknameTextField extends StatefulWidget {
  final Function(String)? callback;
  final ValueChanged? Onchanged;

  const NicknameTextField(this.callback, {super.key, this.Onchanged});

  @override
  State<NicknameTextField> createState() => _NicknameTextFieldState();
}

class _NicknameTextFieldState extends State<NicknameTextField> {
  static String inputValue = "";
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
              widget.Onchanged?.call(value);
            });
            widget.callback!(inputValue);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Nickname "),
          )),
    ]);
  }
}
