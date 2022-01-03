
/*
 Dart is a true OOP language, so even functions are objects and have a type, Function
 Functions can be assigned to variables or passed as arguments to other functions
 TODO: Check Callable Classes [https://dart.dev/guides/language/language-tour#callable-classes]
 */
var _nobleGases = {
  for (var i = 0; i < 5; i++) (i + 1) : 'Gas #${i + 1}'
};

bool isNoble(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}

// => shorthand for { return expr; } It's called arrow syntax
// Only expressions are supported not statements
bool isNobleReduced(int atomicNumber) => _nobleGases[atomicNumber] != null;

bool isEven(int number) {
  if(number % 2 ==0 ){ return true; } else { return false; }
}

/*
  Named parameters are optional unless they're specifically marked as required
  You need to use curly brackets to specify named parameters in a function or constructor
 */

void enableFlags({required bool bold, bool? hidden, int delay = 5}) {
  print('Bold enabled: $bold');
  print('Hidden enabled: $hidden');
  print('Delay ms: $delay');
}

/*
  Optional positional params [type param1, type param2,..., type param_n = default value]
 */
void log(DateTime timestamp, [String device = "NA"]) {
  print("$timestamp: $device");
}

/*
  Main function can receive a non mandatory list of arguments
  e.g.
  void main(List<String> args) {
    ....
  }
 */

int square(int number) => number * number;
void printSquare(int number) => print("$number X $number = ${square(number)}");

var topLevel = true;
void function() {
  var insideMyFunction = true;
  // assert(insideNestedFunction); Error trying to access variables from inner scopes
  void nestedFunction() {
    var insideNestedFunction = true;
    assert(insideMyFunction);
    assert(insideNestedFunction);
    assert(topLevel);
  }
}

/*
  Returns a function
*/
Function makeAdder(int addBy) => (int i) => i + addBy;

// Top-Level Function
void foo() { }
class A {
  // Static method
  static void bar() { }
  // Instance method
  void baz() { }
}

/*
   If return type is not specified, it will return null by default
 */
returnNull() { }

/*
  Every app must have a top level main function.
  Only one main function is allowed per application or file
 */
void main() {

  print('FUNCTIONS\n');
  var atomicNumbers = [3, 7];
  print(isNoble(atomicNumbers[0]));
  print(isNobleReduced(atomicNumbers[1]));
  enableFlags(bold: true);
  enableFlags(bold: false, hidden: false);
  log(DateTime.now());
  log(DateTime.now(),"Macbook Pro");

  // Functions as first class objects
  [ for(var i = 0; i < 10; i++) i + 1]
    .forEach(printSquare);
  var myMagicFunc = () => print("Magic Func says hi");
  myMagicFunc();
  // Anon functions
  const list = ['apples', 'bananas', 'oranges'];
  list.forEach((element) {
    print("${list.indexOf(element)}: $element");
  });
  list.forEach((element) => print("These are my fruits: $element"));
  // Lexical scope
  function();
  // Lexical closure
  var adder = makeAdder(3);
  var result = adder(2);
  assert(result == 5);

  // Comparing Function Types
  Function x;
  x = foo; // Compare top level functions
  assert(foo == x);
  x = A.bar;  // Compare static methods
  assert(x == A.bar);
  var v = A();
  var w = A();
  var y = w;
  x = w.baz;
  assert(x == y.baz); // Same instances
  assert(v.baz != w.baz); // Different instances
  assert(returnNull() == null);
}
