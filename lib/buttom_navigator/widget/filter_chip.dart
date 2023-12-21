import 'package:flutter/material.dart';

// ignore: camel_case_types
class filterChipWidget extends StatefulWidget {
  final String chipName;

  const filterChipWidget({super.key, required this.chipName});

  @override
  State<filterChipWidget> createState() => _filterChipWidgetState();
}

class _filterChipWidgetState extends State<filterChipWidget> {
  var isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(widget.chipName),
      selected: isSelected,
      onSelected: (bool click) {
        setState(() {
          isSelected = click;
        });
      },
      selectedColor: Colors.blue,
    );
  }
}