import 'package:flutter/material.dart';

class SliderButton extends StatefulWidget {
  final Function(double)? callback;
  final ValueChanged? onChanged;
  const SliderButton(this.callback, {super.key, this.onChanged});

  @override
  State<SliderButton> createState() => _SliderButtonState();
}

class _SliderButtonState extends State<SliderButton> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0.0,
      max: 10,
      divisions: 10,
      value: _currentSliderValue,
      label: _currentSliderValue.toString(),
      onChanged: (value) {
        setState(() {
          _currentSliderValue = value;
          widget.onChanged?.call(value);
        });
        widget.callback!(_currentSliderValue);
      },
    );
  }
}
