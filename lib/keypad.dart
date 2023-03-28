import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpm_calculator_ui/calculatorModel.dart';
import 'package:rpm_calculator_ui/main.dart';

import 'button_grid.dart';
import 'commands.dart';

class Keypad extends StatelessWidget {
  const Keypad({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculatorModel>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: ButtonGrid([
        [
          ButtonDef("C", () => provider.execute(Clear())),
          ButtonDef("U", () => provider.execute(Undo())),
          ButtonDef("<-", () => provider.remove()),
          ButtonDef("/", () => provider.execute(Division())),
        ],
        [
          ButtonDef("7", () => provider.addDigit(7)),
          ButtonDef("8", () => provider.addDigit(8)),
          ButtonDef("9", () => provider.addDigit(9)),
          ButtonDef("*", () => provider.execute(Multiplication())),
        ],
        [
          ButtonDef("4", () => provider.addDigit(4)),
          ButtonDef("5", () => provider.addDigit(5)),
          ButtonDef("6", () => provider.addDigit(6)),
          ButtonDef("-", () => provider.execute(Subtraction())),
        ],
        [
          ButtonDef("1", () => provider.addDigit(1)),
          ButtonDef("2", () => provider.addDigit(2)),
          ButtonDef("3", () => provider.addDigit(3)),
          ButtonDef("+", () => provider.execute(Addition())),
        ],
        [

          ButtonDef("0", () => provider.addDigit(0)),
          ButtonDef(".", () => provider.addDecimal()),
          ButtonDef("π",() => provider.addDigit(3.14)),
          ButtonDef("=", () => provider.enter()),
        ],
      ]),
    );
  }
}