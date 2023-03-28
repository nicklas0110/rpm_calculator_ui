import 'package:flutter/material.dart';

class ButtonDef {
  final String text;
  final VoidCallback? onPressed;
  const ButtonDef(this.text, [this.onPressed]);
}

class ButtonGrid extends StatelessWidget {
  List<List<ButtonDef>> buttons;

  ButtonGrid(List<List<ButtonDef>> this.buttons);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: buttons
          .map((col) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: col
                        .map((row) => _buildButton(row.text, row.onPressed))
                        .toList(),
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildButton(String text, VoidCallback? onPressed) {
    return Expanded(
      key: ValueKey(text),
      child: IconButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[900],
          shape: const CircleBorder(),
          minimumSize: const Size(85.0, 85.0),
          padding: const EdgeInsets.all(20),
        ),
        icon: Text(
          text,
          style: TextStyle(
          color: Colors.white,
          fontSize: 40.0,
        ),
      ),
    ));
  }
}
