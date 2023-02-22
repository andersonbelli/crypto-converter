import 'package:flutter/material.dart';

class CompareCoinVsCurrency extends StatelessWidget {
  final String selectedCoin;
  final String selectedCurrency;

  const CompareCoinVsCurrency({
    Key? key,
    required this.selectedCoin,
    required this.selectedCurrency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(
            color: Colors.black87,
          ),
          children: <TextSpan>[
            TextSpan(
              text: selectedCoin,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const TextSpan(
              text: '  ❌  ',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: selectedCurrency,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
