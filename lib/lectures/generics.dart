
abstract class Cache<K,T> {
  var cache = <K,T> { };
  T? get(K key);
  void put(K key, T value);
}

class StringCache implements Cache<String, String> {
  @override
  Map<String, String> cache = {};

  @override
  String? get(String key) {
    return cache[key];
  }

  @override
  void put(String key, String value) {
    cache[key] = value;
  }
}

abstract class SomeBaseClass { }

class Foo<T extends SomeBaseClass> {
  // Implementation goes here...
  @override
  String toString() => "Instance of 'Foo<$T>'";
}

class Extender extends SomeBaseClass { }

void main() {
  print("GENERICS\n");
  Cache cache = StringCache();
  print("${cache.get("user")}");
  cache.put("user", "isaaccabrera-kueski");
  print("${cache.get("user")}");
  var stringNumbers = <String>[
    for(var i = 0; i < 10; i++)
      "Number $i"
  ];
  print(stringNumbers);

}