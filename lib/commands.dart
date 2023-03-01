import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'Stack.dart';

abstract class Command {
  execute(CalcStack numbers);

}

class Addition extends MasterClass {

  @override
  result(num numb1, num numb2) {
    return numb1+numb2;
  }

}

class Subtraction extends MasterClass {


  @override
  result(num numb1, num numb2) {
    return numb2-numb1;
  }

}


class Multiplication extends MasterClass {

  @override
  result(num numb1, num numb2) {
    return numb1*numb2;
  }

}

class Division extends MasterClass {
  @override
  result(num numb1, num numb2) {
    return numb2/numb1;
  }


}


abstract class MasterClass implements Command {
  @override
  execute(CalcStack numbers) {
    var numb1 = numbers.pop();
    var numb2 = numbers.pop();
    numbers.push(result(numb1, numb2));
    return numbers.peek();
  }

  result(num numb1, num numb2);

}


class Quit implements Command{
  @override
  execute(CalcStack numbers) {
    exit(1);
  }

}

class Clear implements Command {
  @override
  execute(CalcStack numbers) {
    numbers.clear();
  }

}