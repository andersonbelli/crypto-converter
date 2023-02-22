import 'package:flutter/material.dart';

class CompareCoinItem extends StatelessWidget {
  final String title;
  final String value;

  const CompareCoinItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          color: Theme.of(context).bottomAppBarColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          child: Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ],
    );
  }
}
