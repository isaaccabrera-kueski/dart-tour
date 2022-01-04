import 'dart:math';

const double xOrigin = 0;
const double yOrigin = 0;

class Point {
  double x = 0;
  double y = 0;
  double distanceToOrigin = 0;

  // Default constructor
  Point(this.x, this.y);

  // Named constructor [origin]
  Point.origin()
      : x = xOrigin,
        y = yOrigin;

  // Besides invoking a superclass constructor, you can also initialize
  // instance variables before the constructor body runs.
  // Separate initializers with commas.
  // Initialization steps
  // 1. initializer list
  // 2. superclass’s no-arg constructor
  // 3. main class’s no-arg constructor
  Point.withDistance(this.x, this.y)
      : distanceToOrigin = sqrt(x * x + y * y); // Initializer list

  // During development you can use assert
  Point.withAssert(this.x, this.y) : assert(x >= 0) {
    print('In Point.withAssert(): ($x, $y)');
  }

  // Redirecting constructors
  // Delegates to the main constructor
  Point.alongXAxis(double x) : this.withDistance(x, 0);

  @override
  String toString() {
    return "(x: $x, y: $y) Dis: ${distanceToOrigin.toStringAsFixed(2)}";
  }
}

class ProfileMark {
  final String name;
  final DateTime start = DateTime.now();

  ProfileMark(this.name);

  ProfileMark.unnamed() : name = '';
}

class Person {
  String? firstName;

  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson(data).
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
  }
}

// Constant Constructors
// All variables must be final
// const constructors do not always create constants
// Check [https://dart.dev/guides/language/language-tour#using-constructors]
class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);

  final double x, y;

  const ImmutablePoint(this.x, this.y);
}

// Factory constructor
// This type of constructor is used when it doesn't always create a new instance
// of the class. For example, a factory might return an instance from the cache
// factory constructor do not have access to [this]
class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(
        name, () => Logger._internal(name)
    );
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

// Methods
class Vector {
  final double x,y;
  Vector(this.x, this.y);

  // Instance method
  @override
  String toString() {
    return '(X: $x, Y: $y)';
  }

  // Operators
  Vector operator +(Vector u) {
    return Vector(x + u.x , y + u.y);
  }
  Vector operator -(Vector u) {
    return Vector(x - u.x , y - u.y);
  }
}

// Getters and Setters
class Rectangle {
  double left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  // Define two calculated properties: right and bottom.

  // Computed properties [right] and [bottom]
  // Using arrow notation for getters and setters
  double get right => left + width;
  set right(double value) => left = value - width;

  // Using curly braces notation
  double get bottom {
    return top + height;
  }
  set bottom(double value) {
    top = value - height;
  }

}

// Abstract methods
// This type of methods can only exist within abstract classes
abstract class Doer {
  // Define instance variables and methods...
  void doSomething(); // Define an abstract method. Add a trailing comma after
                      // method signature
}
// Inheritance
class EffectiveDoer extends Doer {
  @override
  void doSomething() {
    // Provide an implementation, so the method is not abstract here...
  }
}

// Implicit interfaces
// Extension
// A Human. The implicit interface contains greet().
class Human {
  // In the interface, but visible only in this library.
  final String _name;

  // Not in the interface, since this is a constructor.
  Human(this._name);

  // In the interface.
  String greet(String who) => 'Hello, $who. I am $_name.';
}

// An implementation of the Person interface.
class Impostor implements Human {
  @override
  String get _name => '';

  @override
  String greet(String who) => 'Hi $who. Do you know who I am?';

}

String greetBob(Impostor impostor) => impostor.greet('Bob');

// Implementing multiple interfaces
// class Point implements Comparable, Location {...}
class User {
  final String firstName, lastName;

  User({required this.firstName, required this.lastName});

  String get fullName => '$firstName $lastName';

}

// Extensions
// Create Complete Name extension on User
extension CompleteNameExt on User {
  String getCompleteName() {
    return 'Complete Name: $firstName $lastName';
  }
}

// Enumerated types
enum AuthProvider {
  google,
  facebook,
  email
}

// TODO: Pending review mixins

// Static variables
// Class-wide state constants
class Queue {
  static const initialCapacity = 16;
  /*
    Static methods do not have access to this but,
    they can access static variables
   */
  static void printInitialCapacity() {
    print('Initial size: $initialCapacity');
  }
}


void main() {
  print("CLASSES\n");
  Point origin = Point.origin();
  Point currentPosition = Point(1.5, 6.3);
  Point wDistance = Point.withDistance(5.7, 8.9);
  Point alongXAxis = Point.alongXAxis(9);
  print(
      "Origin: $origin, Position: $currentPosition, With Distance: $wDistance");
  print('Along X Axis: $alongXAxis');

  var employee = Employee.fromJson({});
  print(employee);
  // Prints:
  // in Person
  // in Employee
  // Instance of 'Employee'
  var logger = Logger('UI');
  logger.log('Button clicked');

  var logMap = {'name': 'UI'};
  var loggerJson = Logger.fromJson(logMap);
  var u = Vector(4, 5);
  var w = Vector(4.5, 5.6);
  var r = u + w;
  print("$u + $w = $r");

  Rectangle shape = Rectangle(5, 5, 9, 4);
  print('Bottom: ${shape.bottom}, Right: ${shape.right} ${shape.height}');
  Impostor i = Impostor();
  var greeting = greetBob(i);
  print(greeting);
  var user = User(firstName: 'Isaac', lastName: 'Cabrera');
  print(user.firstName);
  print('Full name: ${user.fullName}');
  print(user.getCompleteName());
  AuthProvider authProvider = AuthProvider.facebook;
  print(authProvider);
  Queue.printInitialCapacity();
}
