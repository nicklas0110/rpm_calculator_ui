import 'package:flutter/material.dart';
import 'package:rpm_calculator_ui/Stack.dart';
import 'package:rpm_calculator_ui/commands.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RPM Calculator',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const SafeArea(child: MyHomePage(title: 'RPM Calculator')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CalcStack stack = CalcStack();
  String displayText = "0";


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(

        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            SizedBox(
              width: 320, // Set the desired width of the container
              height: 25, // Set the desired height of the container
              child: FittedBox(
                fit: BoxFit.scaleDown, // Scale the text down to fit within the constraints
                alignment: Alignment.centerRight, // Align the text to the right
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.format_list_numbered, color: Colors.white, size: 150),
                    Text(
                      stack.isEmpty() ? " " : stack.toString(),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 100.0,
                          fontWeight: FontWeight.w300
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 333, // Set the desired width of the container
              height: 80, // Set the desired height of the container
              child: FittedBox(
                  fit: BoxFit.scaleDown, // Scale the text down to fit within the constraints
                  alignment: Alignment.centerRight, // Align the text to the right
                  child: Text(
                    displayText,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 80.0,
                        fontWeight: FontWeight.w300
                    ),
                  )
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 10),
                ElevatedButton( //CLEAR
                    onPressed: () {
                      setState(() {
                        stack.clear();
                        displayText = "0";
                      });
                      },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[400],
                      shape: const CircleBorder(),
                      minimumSize: const Size(85.0, 85.0),
                      padding: const EdgeInsets.all(20),

                    ),
                    child: const Text("C",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                      ),
                    )
                ),

                ElevatedButton( //UNDO
                  onPressed: () {
                    setState(() {
                      stack.pop();
                      }
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[400],
                    shape: const CircleBorder(),
                    minimumSize: const Size(85.0, 85.0),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Icon(Icons.replay, color: Colors.black, size: 45,),
                ),

                SizedBox(
                  child: ElevatedButton( //BUTTON ETR
                    onPressed: (){  setState(() {
                      if (displayText != "0") {
                        stack.push(num.tryParse(displayText)!);
                      }
                    });
                      displayText = "0";
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.orange.shade700),
                      minimumSize: MaterialStateProperty.all<Size>(
                        const Size(177, 83.0),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ENTER',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                        Icon(Icons.arrow_upward, color: Colors.white, size: 45),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),

            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 10),
                ElevatedButton( //BUTTON 7
                    onPressed: () {
                      setState(() {
                        if (displayText == "0") {
                          displayText = "";
                        }
                        displayText += "7";
                      });
                      },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                      shape: const CircleBorder(),
                      minimumSize: const Size(85.0, 85.0),
                      padding: const EdgeInsets.all(20),

                    ),
                    child: const Text("7",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                ),

                ElevatedButton( //BUTTON 8
                    onPressed: () {
                      setState(() {
                        if (displayText == "0") {
                          displayText = "";
                        }
                        displayText += "8";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                      shape: const CircleBorder(),
                      minimumSize: const Size(85.0, 85.0),
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Text("8",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                ),

                ElevatedButton( //BUTTON 9
                    onPressed: () {
                      setState(() {
                        if (displayText == "0") {
                          displayText = "";
                        }
                        displayText += "9";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                      shape: const CircleBorder(),
                      minimumSize: const Size(85.0, 85.0),
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Text("9",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                ),

                ElevatedButton( //BUTTON -
                  onPressed: () {
                    setState(() {
                      Subtraction().execute(stack);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[700],
                    shape: const CircleBorder(),
                    minimumSize: const Size(85.0, 85.0),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Icon(Icons.remove, color: Colors.white, size: 45,),
                ),
                const SizedBox(width: 10),
              ],
            ),

            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 10),
                ElevatedButton( //BUTTON 4
                    onPressed: () {
                      setState(() {
                        if (displayText == "0") {
                          displayText = "";
                        }
                        displayText += "4";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                      shape: const CircleBorder(),
                      minimumSize: const Size(85.0, 85.0),
                      padding: const EdgeInsets.all(20),

                    ),
                    child: const Text("4",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                ),

                ElevatedButton( //BUTTON 5
                    onPressed: () {
                      setState(() {
                        if (displayText == "0") {
                          displayText = "";
                        }
                        displayText += "5";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                      shape: const CircleBorder(),
                      minimumSize: const Size(85.0, 85.0),
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Text("5",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                ),

                ElevatedButton( //BUTTON 6
                    onPressed: () {
                      setState(() {
                        if (displayText == "0") {
                          displayText = "";
                        }
                        displayText += "6";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                      shape: const CircleBorder(),
                      minimumSize: const Size(85.0, 85.0),
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Text("6",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                ),

                ElevatedButton( //BUTTON +
                  onPressed: () {
                    setState(() {
                      Addition().execute(stack);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[700],
                    shape: const CircleBorder(),
                    minimumSize: const Size(85.0, 85.0),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 45,),
                ),
                const SizedBox(width: 10),
              ],
            ),

            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 10),
                ElevatedButton( //BUTTON 1
                    onPressed: () {
                      setState(() {
                        if (displayText == "0") {
                          displayText = "";
                        }
                        displayText += "1";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                      shape: const CircleBorder(),
                      minimumSize: const Size(85.0, 85.0),
                      padding: const EdgeInsets.all(20),

                    ),
                    child: const Text("1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                ),

                ElevatedButton( //BUTTON 2
                    onPressed: () {
                      setState(() {
                        if (displayText == "0") {
                          displayText = "";
                        }
                        displayText += "2";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                      shape: const CircleBorder(),
                      minimumSize: const Size(85.0, 85.0),
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Text("2",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                ),

                ElevatedButton( //BUTTON 3
                    onPressed: () {
                      setState(() {
                        if (displayText == "0") {
                          displayText = "";
                        }
                        displayText += "3";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                      shape: const CircleBorder(),
                      minimumSize: const Size(85.0, 85.0),
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Text("3",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                ),

                ElevatedButton( //BUTTON x
                  onPressed: () {
                    setState(() {
                      Multiplication().execute(stack);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[700],
                    shape: const CircleBorder(),
                    minimumSize: const Size(85.0, 85.0),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Icon(Icons.close, color: Colors.white, size: 45,),
                ),
                const SizedBox(width: 10),
              ],
            ),

            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 10),
                ElevatedButton( //BUTTON 0
                    onPressed: () {
                      setState(() {
                        if (displayText == "0") {
                          displayText = "";
                        }
                        displayText += "0";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                      shape: const CircleBorder(),
                      minimumSize: const Size(85.0, 85.0),
                      padding: const EdgeInsets.all(20),

                    ),
                    child: const Text("0",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                ),

                ElevatedButton( //BUTTON .
                    onPressed: () {
                      setState(() {
                        if (displayText == "0") {
                          displayText = "";
                        }
                        if (!displayText.contains(".")) {
                          displayText += ".";
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                      shape: const CircleBorder(),
                      minimumSize: const Size(85.0, 85.0),
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Text(".",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                ),

                ElevatedButton( //BUTTON π
                    onPressed: () {
                      setState(() {
                        if (!displayText.contains(".")) {
                          displayText += ".";
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                      shape: const CircleBorder(),
                      minimumSize: const Size(85.0, 85.0),
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Text("π",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                ),

                ElevatedButton( //BUTTON %
                  onPressed: () {
                    setState(() {
                      Division().execute(stack);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[700],
                    shape: const CircleBorder(),
                    minimumSize: const Size(85.0, 85.0),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Icon(Icons.percent_sharp, color: Colors.white, size: 45,),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}