import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  final ValueChanged? onChanged;
  const SwitchWidget({super.key, this.onChanged});
  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _switchValue,
      onChanged: (value) {
        setState(() {
          _switchValue = value;
          widget.onChanged?.call(value);
        });
      },
    );
  }
}
