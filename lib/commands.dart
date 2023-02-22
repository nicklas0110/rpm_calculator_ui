abstract class ICommand{ //the commands
  num executeAddition();
  num executeSubtraction();
  num executeMultiply();
  num executeDivision();
}

class Numbers implements ICommand{ //numbers to calculate
  num num1;
  num num2;

  Numbers(this.num1, this.num2);

  @override
  num executeAddition() { //Addition
    return num1+num2;
  }
  @override
  num executeSubtraction() { //Subtraction
    return num1-num2;
  }
  @override
  num executeMultiply() { //Multiply
    return num1*num2;
  }
  @override
  num executeDivision() { //Division
    return num1/num2;
  }

}