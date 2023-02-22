import 'dart:io';

import 'commands.dart';
main() {
  var input; //input
  List<num> inputList = [] ; //stack of inputs

  do {
    print("Enter a number to add to the stack or an operator to calculate the last two in the stack");
    print("Stack: " + inputList.toString());
    input = stdin.readLineSync();
    try {
      switch (input) { //switch with +-*/ that does the math with the last 2 in a stack and prints it
        case '+': //Addition
          num num1 = inputList[inputList.length - 1];
          num num2 = inputList[inputList.length - 2];
          num result = Numbers(num1, num2).executeAddition();

          print(num1.toString() + " + " + num2.toString() + " = " + result.toString());

          inputList.removeLast();
          inputList.removeLast();
          inputList.add(result);
          break;

        case '-': //Subtraction
          num num1 = inputList[inputList.length - 1];
          num num2 = inputList[inputList.length - 2];
          num result = Numbers(num1, num2).executeSubtraction();

          print(num1.toString() + " - " + num2.toString() + " = " + result.toString());

          inputList.removeLast();
          inputList.removeLast();
          inputList.add(result);
          break;

        case '*': //Multiply
          num num1 = inputList[inputList.length - 1];
          num num2 = inputList[inputList.length - 2];
          num result = Numbers(num1, num2).executeMultiply();

          print(num1.toString() + " * " + num2.toString() + " = " + result.toString());

          inputList.removeLast();
          inputList.removeLast();
          inputList.add(result);
          break;

        case '/': //Division
          num num1 = inputList[inputList.length - 1];
          num num2 = inputList[inputList.length - 2];
          num result = Numbers(num1, num2).executeDivision();

          if(result.isNaN) { //Checks for 0 divided by 0
            print("I won't let you!!!");
            print("[STACK CLEARED]");
            inputList.clear();
          }

          print(num1.toString() + " / " + num2.toString() + " = " + result.toString());

          inputList.removeLast();
          inputList.removeLast();
          inputList.add(result);
          break;

        case 'clear' : //clear whole stack
          inputList.clear();
          print("[STACK CLEARED]");
          break;

        case 'undo' : //remove last in stack
          inputList.removeLast();
          break;

        default: //parses input into num
          if (input != null) {
            num number = num.parse(input);
            inputList.add(number);
          }
          break;
      }
    }
    catch(e){ //gives option to clear/undo/try again if error occurred
      print("Oh no! Wrong input or impossible calculation!!!");
      print("Try again or type 'clear' to clear stack or 'undo' to remove last number or 'quit' to exit program)");
    }




  }
  while(input!="quit"); //keeps program running until user types quit
}

