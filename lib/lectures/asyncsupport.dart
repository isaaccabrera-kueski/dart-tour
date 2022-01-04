
Future<String> getLibVersion() async {
  await Future.delayed(const Duration(seconds: 2));
  return "1.4.5.6";
}

// Generators
// When you need to lazily produce a sequence of values,
// consider using a generator function. Dart has built-in support for two kinds of
// generator functions:
// * Sync produces a Iterable
// * Async produces a Stream
Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) {
    yield k++;
  }
}

Stream<int> asynchronousNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) {
    yield k++;
  }
}

// if generator is recursive you can improve performance using yield*
Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n - 1);
  }
}

// Create your own metada
class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}


// You can retrieve metadata at runtime using reflection.
@Todo("Isaac", "Implement Kueski Client class")
abstract class KueskiClient {
  @override
  String toString() {
    return '';
  }
}

// Callable classes
class WannabeFunction {
  String call(String a, String b, String c) => '$a $b $c!';
}

// To create and execute use cases
var wf = WannabeFunction();
var out = wf('Hi', 'there,', 'gang');

void main() async {
  print("ASYNC SUPPORT \n");
  print("[${DateTime.now()}] Getting lib version");
  var version =  getLibVersion();
  version.then((value) {
    print("[${DateTime.now()}] Inside then Version: $value");
  });
  print("Before await");
  var v = await getLibVersion();
  print("[${DateTime.now()}] In main Version: $v");
  print("After await");

  // Async for loop
  // To stop listening to the stream, you can use a break or return statement,
  // which breaks out of the for loop and unsubscribes from the stream.
  // await for (varOrType identifier in expression) {
  //   // Executes each time the stream emits a value.
  // }

  // Generators
  var items = naturalsTo(5);
  print(items);
  var asyncItems = asynchronousNaturalsTo(5);
  print(asyncItems);
  asyncItems.listen((event) {
    print("Event $event");
  });
  print(out);
}