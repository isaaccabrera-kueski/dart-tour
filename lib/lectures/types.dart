/*
Built-in Types
  Numbers (int,double)
  String
  Boolean (bool)
  Lists (List or arrays)
  Sets
  Maps
  Runes (often replaced by the characters APIO
  Symbol
  The vale null (Null)

 NOTES:
 Object: The superclass of all Dart classes except Null
 Future and Stream: Use in async support
 Iterable: Used in for-in loops and sync generator functions
 Never: Indicates that the expression can never successfully finish evaluating. Most often used for functions that
 always throw an exception
 dynamic: Indicates that you want to disable static checking. Usually you should use Object or Object? instead.
 void: Indicates that a value is never used. Offten used as  return type.

 -- The Object, Object?, Null, and Never classes have special roles in the class hierarchy,
*/

import 'package:characters/src/extensions.dart';


void main() {
  print("NUMBERS\n");
  /*
    Numbers
   */
  var x = 1; // int
  var hex = 0xFF; // int in HEX
  var exponent = 5e8;
  print(exponent);
  var y = 1.1; // double
  var exponents = 1.42e5;
  print(exponents);

  num vnum = 1;
  vnum += 2.5;
  print(vnum);

  double z = 1; // equivalent to 1.0
  // Parsing
  // String - int
  var one = int.parse('1');
  assert(one == 1);
  // String -> double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);
  // int -> String
  String oneAsString = 1.toString();
  assert(oneAsString == '1');
  // double -> String
  String piAsString = 3.14159.toStringAsFixed(2);
  assert(piAsString == '3.14');

  // The int type specifies the traditional bitwise shift (<<, >>, >>>), complement(~),AND (&), OR (|), XOR(^)
  assert((3 << 1) == 6); // 0011 << 1 == 0110
  assert((3 | 4) == 7); // 0011 | 0100 == 0111
  assert((3 & 4) == 0); // 0011 & 0100 == 0000

  const msPerSecond = 1000;
  const secondsUntilRetry = 5; // var secondsUntilRetry = 5; Error in line  63
  const msUntilRetry = msPerSecond * secondsUntilRetry;

  print('\nSTRINGS\n');
  /*
    Strings
    A Dart string holds a sequence of UTF-16 code units.
   */
  var s1 = 'Single quote string';
  var s2 = "Double quote string";
  var s3 = 'Escaping It\'s great';
  var s4 = "It's never been easy to use other delimiter";
  // Interpolation
  var s = 'string interpolation';
  assert('Dart $s' == 'Dart string interpolation');
  assert('Dart ${s.toUpperCase()}' == 'Dart STRING INTERPOLATION'); // == same sequence of code units
  // Concat using adjacent strings literals
  var concatOne = 'hello'
    ' world'
    "!!!";
  var concatTwo = "concat " + "using " + " + sign";
  print(concatOne);
  print(concatTwo);
  // Multiline String
  var multilineStr = """
  This is 
  a multiline string
  with double quotes  !!
  """;
  var multilineStr2 = '''
  This is
  a multiline string
  with single quotes !!
  ''';
  print(multilineStr);
  print(multilineStr2);

  // Raw String
  var rawStr = r'In a raw string, not even \n gets special treatment.';
  print(rawStr);
  // These work in a const string.
  const aConstNum = 0;
  const aConstBool = true;
  const aConstString = 'a constant string';

// These do NOT work in a const string.
  var aNum = 0;
  var aBool = true;
  var aString = 'a string';
  const aConstList = [1, 2, 3];

  const validConstString = '$aConstNum $aConstBool $aConstString';
  // const invalidConstString = '$aNum $aBool $aString $aConstList';

  print("\nBOOLEAN\n");
  var isPremium = false;
  bool isValid = true;
  var hitPoints = 0;
  assert(hitPoints <= 0);
  print("Premium User: $isPremium");

  print("\nLISTS\n");
  /*
    Lists use zero-based indexing, inclusive rage [0, length - 1]
   */
  var numbers = [1, 2, 3, 4, 5]; // Inferred type List<int>
  var users = [
    'isaacc',
    'sergioc', // Trailing comma is ok
  ];
  assert(numbers.length == 5);
  assert(numbers[2] == 3);
  // Compile time constant list
  var constantList = const [1,2,3,4,5,];
  // constantList[1] = -1; Runtime Error
  const List<int> constLisTwo = [0,0,0,];
  // constLisTwo[0] = 1; Runtime Error
  // [NOTE]: spread and null-aware spread operators were introduced in Dart 2.3
  var list = [1,2,3,];
  var fullList = [0, ...list];
  print('Full List $fullList');

  var optList;
  var listFullTwo = [0, ...?optList];
  print('Full List Two $listFullTwo');
  assert(listFullTwo.length == 1);
  // Collection if and Collection for
  var promoActive = true;
  var nav = [
    'Home',
    'Furniture',
    'Plants',
    if(promoActive) 'Outlet'
  ];
  print(nav);
  promoActive = false;
  var navTwo = [
    'Home',
    'Furniture',
    'Plants',
    if(promoActive) 'Outlet2'
  ];
  print(navTwo);

  var listOfInts = [1,2,3,];
  var listOfStrings = [
    '#0',
    for(var item in listOfInts) '#$item'
  ];
  print(listOfStrings);

  print('\nSETS\n');
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  var emptySet = <dynamic>{};
  var emptyStringSet= <String>{};
  Set<String> names = {};
  var elements = <String>{};
  elements.add("gold");
  elements.add('fluorine');
  elements.addAll(halogens);
  print(elements);
  assert(elements.length == 6);
  const constantSet = {
    'this', 'is', 'constant'
  };
  assert(elements.contains('gold'));
  try {
    constantSet.add('is');
  } catch(e) {
    print(e);
  }
  // [NOTE] Sets support spread operators and collection if and for

  print('\nMAPS\n');
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  var giftsTwo = Map<String, String>(); // new keyword is optional in Dart
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var nobleGasesTwo = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';
  var giftsMap = {'first': 'Lego'};
  giftsMap['second'] = 'Skate board';
  print('Gifts Map $giftsMap');
  assert(giftsMap['first'] != null);
  assert(giftsMap['third'] == null);
  assert(giftsMap.length == 2);
  // Const map
  var constMap = const {'first': 'one'};
  // constMap['second'] = 'two'; Runtime Error! Cannot modify map
  // [NOTE] Maps support spread operators and collection if and for

  print('\nRUNES\n');
  /*
  Unicode code point is \uXXXX
  XXXX is a 4-digit hex value =
  To specify more or less than 4 hex digits use curly brackets
  \u{XXX}
   */
  var smileFace = '\u{1f606}';
  var heart = '♥';
  print(smileFace);
  print(heart);
  var hi = 'Hi 🇩🇰';
  print(hi);
  print(hi.length); // Len 7
  print('The end of the string: ${hi.substring(hi.length - 1)}');
  for (var element in hi.characters) {
    print('Element: $element');
  }
  print('# characters: ${hi.characters.length}');
  print('The last character: ${hi.characters.last}\n');

  print("\nSYMBOLS\n");
  // Compile time constants

}