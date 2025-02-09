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
    final calculatorProvider =
        Provider.of<CalculatorProvider>(context, listen: false);
    final TextStyle? textStyle = Theme.of(context).textTheme.titleLarge;
    final mediaQuery = MediaQuery.of(context).size;
    return Material(
      color: backgroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: () {
          calculatorProvider.addToEquation(
            label,
            canBeFirst,
            context,
          );
        },
        child: Center(
          child: isEqualSign
              ? Container(
                  height: mediaQuery.width * 0.1,
                  width: mediaQuery.width * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: orangeColor,
                  ),
                  child: Center(
                    child: Text(
                      label,
                      style: textStyle?.copyWith(color: backgroundColor),
                    ),
                  ),
                )
              : Text(
                  label,
                  style: textStyle?.copyWith(
                      color: isColored ? orangeColor : buttonsBackgroundColor),
                ),
        ),
      ),
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
