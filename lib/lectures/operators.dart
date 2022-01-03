

void main() {
  print("OPERATORS\n");
  /*
    We can implement many of these operators as class members
    [Link] https://dart.dev/guides/language/language-tour#_operators
   */
  /*
    Arithmetic operators
      + (Add)
      - (Subtract)
      -exp (Unary minus, also known as negation) reverse the sign
      * (Multiply)
      / (Divide)
      ~/ (Divide return an integer result
      %  (Get integer reminder of a division)
   */

  assert(2 + 3 == 5);
  assert(2 - 3 == -1);
  assert(2 * 3 == 6);
  assert(5 / 2 == 2.5); // Result is a double
  assert(5 ~/ 2 == 2); // Result is an int
  assert(5 % 2 == 1); // Remainder
  assert('5/2 = ${5 ~/ 2} r ${5 % 2}' == '5/2 = 2 r 1');

  // Prefix and postfix increment and decrement operators
  int a,b;
  a = 0;
  b = ++a;
  assert(a == b); // 1 == 1
  a = 0;
  b = a++;
  assert(a != b); // 1 != 0
  a = 0;
  b = --a;
  assert(a == b); // -1 == -1
  a = 0;
  b = a--;
  assert(a !=b ); // -1 != 0

  /*
    Equality and relational operators
    == Equal
    != Not equal
    >  Greater than
    <  Less than
    >= Greater than or equal to
    <= Less than or equal to
   */
  assert(2 == 2);
  assert(2 != 3);
  assert(3 > 2);
  assert(2 < 3);
  assert(3 >= 3);
  assert(2 <= 3);

  /*
    Type test operators

    as  Typecast
    is  True is the object has the specified type
    is! True if the object does not have the specified type

   */
  Employee e = Employee("1", "Isaac");
  assert(e is Person);
  print(e);
  Person p = Employee("2", "Sergio");
  assert(p is Employee);
  print(p);

  /*
    Assignment Operators
   */
  int number  = 0;
  var zero = number;
  var firstNull;
  // Assign value if firsNull is null
  firstNull ??= number + 6;
  firstNull ??= 99;
  assert(zero == number);
  assert(firstNull == 6);
  // Compound assignment operators
  // a op= b ===> a = a op b
  // a += b  ===> a = a + b
  var  two = 2;
  two *= 3;
  assert(two == 6);
  int negativeOne = -2;
  assert(negativeOne < 0);
  negativeOne <<= 1;
  assert(negativeOne == -4);
  negativeOne >>= 2;
  assert(negativeOne == -1);

  /*
    Logical Operators
    &&      => Logical AND
    ||      => Logical OR
    !epx    => Inverts the following expression changes false to true and vice versa
   */
  /*
    Bitwise Operators
    & AND
    | OR
    ^ XOR
    ~exp Unary bitwise complement (0 -> 1, 1 -> 0)
    << Shift left
    >> Shift right
    >>> Unsigned shift right // Requires version 2.14
   */
  const value = 0x22;
  const bitmask = 0x0f;
  assert((value & bitmask) == 0x02); // AND
  assert((value & ~bitmask) == 0x20); // AND NOT
  assert((value | bitmask) == 0x2f); // OR
  assert((value ^ bitmask) == 0x2d); // XOR
  assert((value << 4) == 0x220); // Shift left
  assert((value >> 4) == 0x02); // Shift right
  assert((value >>> 4) == 0x02); // Unsigned shift right
  assert((-value >> 4) == -0x03); // Shift right
  assert((-value >>> 4) > 0); // Unsigned shift right
  /*
    Conditional expressions
    condition ? exp1 : exp2
    if condition is true evaluates exp1; otherwise, evaluates exp2
    expr1 ?? expr2

   */
  var isPublic = true;

  // Similar to ternary operator in C
  var visibility = isPublic ? 'Public' : 'Private';
  // Null check
  var getPlayerName = ({String? name = null}) => name ?? 'Guest';
  print(getPlayerName());
  print(getPlayerName(name: 'Isaac'));
  // Cascade notation
  var builder = HttpKueskiClient.builder()
  ..setTimeoutConnection(100)
  ..setTimeoutWrite(50)
  ..setUrl('www.netflix.com');

  var client = builder.build();
  print(client);

  /*
    Other operators
    () Represents a function call
    [] Subscript access
    ?[] Conditional subscript access
    . Member access
    ?. Conditional member access
   */
  int len = client._url?.length ?? 0; // Non optional string
  String? uri = client._url; // Optional String
}

class Person {
  String name;
  Person(this.name);
  @override
  String toString() {
    return "Person<Name:$name>";
  }
}

class Employee implements Person {

  String id;
  @override
  String name;

  Employee(this.id, this.name);

  @override
  String toString() {
    return "Employee<Id:$id, Name:$name>";
  }

}

abstract class KueskiClient<T> {

  String? _url;
  int? _timeoutRead;
  int? _timeoutWrite;
  int? _timeoutConnection;

  void setUrl(String? url);
  void setTimeoutRead(int? timeoutRead);
  void setTimeoutWrite(int? timeoutWrite);
  void setTimeoutConnection(int? timeoutConnection);
}

abstract class Builder<T> {
  T build();
}

class HttpKueskiClient implements KueskiClient {

  @override
  int? _timeoutConnection;
  @override
  int? _timeoutRead;
  @override
  int? _timeoutWrite;
  @override
  String? _url;

  HttpKueskiClient._();

  @override
  void setTimeoutConnection(int? timeoutConnection) {
    _timeoutConnection = timeoutConnection;
  }

  @override
  void setTimeoutRead(int? timeoutRead) {
    _timeoutRead = timeoutRead;
  }

  @override
  void setTimeoutWrite(int? timeoutWrite) {
    _timeoutWrite = timeoutWrite;
  }

  @override
  void setUrl(String? url) {
    _url  = url;
  }

  static KueskiBuilder builder() {
    return KueskiBuilder();
  }

  @override
  String toString() {
    return "$_timeoutRead $_timeoutWrite $_timeoutConnection $_url";
  }

}

class KueskiBuilder implements Builder<HttpKueskiClient> {
  late HttpKueskiClient client;
  KueskiBuilder() {
    client = HttpKueskiClient._();
  }

  void setUrl(String? url) {
    client.setUrl(url);
  }
  void setTimeoutRead(int? timeoutRead) {
    client.setTimeoutRead(timeoutRead);
  }
  void setTimeoutWrite(int? timeoutWrite) {
    client.setTimeoutWrite(timeoutWrite);
  }
  void setTimeoutConnection(int? timeoutConnection) {
    client.setTimeoutConnection(timeoutConnection);
  }

  @override
  HttpKueskiClient build() {
    return client;
  }
}
