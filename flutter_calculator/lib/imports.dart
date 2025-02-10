import 'package:flutter/material.dart';
import 'package:flutter_calculator/provider/calculator_provider.dart';
import 'package:provider/provider.dart';

const buttonsBackgroundColor = Color(0xFF090E1C);
const backgroundColor = Color.fromARGB(255, 255, 255, 255);
const orangeColor = Color(0xFFFF6700);
const whiteColor = Colors.white;

AppBar appbar(
  BuildContext context,
  String title,
  IconData icon,
  Function() tap,
) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w400, color: orangeColor),
    ),
    actions: [
      IconButton(
        onPressed: tap,
        icon: Icon(icon),
        color: orangeColor,
      ),
    ],
  );
}

class CalculatorButton extends StatelessWidget {
  final String label;
  final bool isColored, isEqualSign, canBeFirst;
  const CalculatorButton(
    this.label, {
    this.isColored = false,
    this.isEqualSign = false,
    this.canBeFirst = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final buttonSize = constraints.maxWidth * 0.88; // Reduced size slightly
        return Material(
          color: backgroundColor,
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: () => Provider.of<CalculatorProvider>(context, listen: false)
                .addToEquation(label, canBeFirst, context),
            child: Container(
              width: buttonSize,
              height: buttonSize,
              decoration: isEqualSign
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(buttonSize * 0.4),
                      color: orangeColor,
                    )
                  : null,
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: buttonSize * 0.35, // Slightly smaller font
                    color: isColored
                        ? orangeColor
                        : isEqualSign
                            ? backgroundColor
                            : buttonsBackgroundColor,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

List<CalculatorButton> buttons = <CalculatorButton>[
  const CalculatorButton('AC', isColored: true, canBeFirst: false),
  const CalculatorButton('⌫', isColored: true, canBeFirst: false),
  const CalculatorButton(' % ', isColored: true, canBeFirst: false),
  const CalculatorButton(' ÷ ', isColored: true, canBeFirst: false),
  const CalculatorButton('7'),
  const CalculatorButton('8'),
  const CalculatorButton('9'),
  const CalculatorButton(' × ', isColored: true, canBeFirst: false),
  const CalculatorButton('4'),
  const CalculatorButton('5'),
  const CalculatorButton('6'),
  const CalculatorButton(' - ', isColored: true, canBeFirst: false),
  const CalculatorButton('1'),
  const CalculatorButton('2'),
  const CalculatorButton('3'),
  const CalculatorButton(' + ', isColored: true, canBeFirst: false),
  const CalculatorButton('00'),
  const CalculatorButton('0'),
  const CalculatorButton('.', canBeFirst: false),
  const CalculatorButton('=', isEqualSign: true, canBeFirst: false),
];
