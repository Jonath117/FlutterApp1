import 'package:flutter/material.dart';

class ItemInfo extends StatelessWidget {
  final IconData icon;
  final String text;
  //atributo para el Style
  final TextStyle? textStyle;

  const ItemInfo({
    super.key,
    required this.icon,
    required this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Icon(icon),
        Text(text, style: textStyle),
      ],
    );
  }
}
