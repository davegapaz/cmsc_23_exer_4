import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  final Function(String)? callback;
  final ValueChanged? onChanged;
  const RadioButton(this.callback, {super.key, this.onChanged});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  final Map<String, bool> _motto = {
    "Haters gonna hate": true,
    "Bakers gonna Bake": false,
    "If cannot be, borrow one from three": false,
    "Less is more, more or less": false,
    "Better late than sorry": false,
    "Don't talk to strangers when your mouth is full": false,
    "Let's burn the bridge when we get there": false
  };

  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _motto.entries
          .map((entry) => RadioListTile(
                title: Text(entry.key),
                value: entry.key,
                groupValue: selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    selectedOption = value as String?;
                    widget.onChanged?.call(value);
                    // state.didChange(value);
                  });
                  widget.callback!(selectedOption!);
                },
              ))
          .toList(),
    );
  }
}
