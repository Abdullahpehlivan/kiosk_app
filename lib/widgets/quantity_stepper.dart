import 'package:flutter/material.dart';

class QuantityStepper extends StatelessWidget {
  final int value;
  final VoidCallback onInc;
  final VoidCallback onDec;
  const QuantityStepper({super.key, required this.value, required this.onInc, required this.onDec});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: onDec, icon: const Icon(Icons.remove)),
        Text('$value'),
        IconButton(onPressed: onInc, icon: const Icon(Icons.add)),
      ],
    );
  }
}
