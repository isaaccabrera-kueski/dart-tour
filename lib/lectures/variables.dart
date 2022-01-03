
import 'dart:math';

void printType(Object value) {
  print("$value - ${value.runtimeType}");
}

int countLines({int max = 8000}) {
  return Random().nextInt(max);
}

void main() {
  print("variables".toUpperCase());
  /**
   * Creating variables
   */
  var name = 'bob'; // Inferred type [String]
  // name = 10; // Error!! int cannot be assigned to String
  Object myObject = "Bob";
  printType(myObject);
  myObject = 45;
  printType(myObject);
  dynamic myDynamic = 'Isaac';
  printType(myDynamic);
  myDynamic = 56.3;
  printType(myDynamic);
  /*
    [NOTE]
   Style Guide recommendation of using var, rather than type annotations, for local variables
   */
  // If null safety is enabled you must initialize the values before you use them
  int lineCount;
  // print(lineCount); // Error!!
  var weLikeToCount = Random().nextInt(6).isEven ? true : false;
  print("We like to count: $weLikeToCount");
  if(weLikeToCount) {
    lineCount = countLines();
  } else {
    lineCount = countLines(max: 5);
  }
  print(lineCount);
  /**
   * [NOTE] late variables were introduced in Dart 2.12
   *
   */
  late var username;
  /**
   * final vs const
   * [NOTE] const is a compile-time constant
   */
  final provider = "Kueski";
  // provider = "PayPal"; // Error final variables cannot be reassigned
  const String laptop = "Mac Book Pro"; // You cannot use const + var
  // const Card myCard = Card("5632555545555"); // Error!!
  final Card myFinalCard = Card("number");
}

class Card {
  String number;
  Card(this.number);
}
