import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpm_calculator_ui/calculatorModel.dart';
import 'package:rpm_calculator_ui/main.dart';

import 'calculatorModel.dart';
import 'commands.dart';

class Display extends StatelessWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculatorModel>(context);
    String number = provider.number;
    if (provider.number == ""){number = "0";}

    return Padding(
      padding: const EdgeInsets.only(top: 190),
      child: Column(
        children: [
          SizedBox(
            width: 320, // Set the desired width of the container
            height: 35, // Set the desired height of the container
            child: FittedBox(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.format_list_numbered,
                      color: Colors.white, size: 300),
                  Text(
                    "${provider.state.registry}",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 200.0,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 333, // Set the desired width of the container
            height: 100, // Set the desired height of the container
            child: FittedBox(
                alignment: Alignment.centerRight,
                child: Text(
                  number,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 80.0,
                      fontWeight: FontWeight.w300),
                )),
          ),
        ],
      ),
    );
  }
}
