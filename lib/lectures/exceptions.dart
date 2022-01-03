
class OutOfLlamasException implements Exception {
  final String message;
  OutOfLlamasException(this.message) : super();
}

void breedMoreLlamas() => print("Breed more llamas");

void buyMoreLlamas() => print("Buy more llamas");

void cleanLlamasStals() => print('Clean llamas stalls');

void misbehave() {
  try {
    dynamic foo = true;
    print(foo++); // Runtime error
  } catch (e) {
    print('misbehave() partially handled ${e.runtimeType}.');
    rethrow; // Allow callers to see the exception.
  }
}

void main() {
  print("EXCEPTIONS\n");
  // Throw an exception
  // throw const FormatException("Invalid email john.doe@");
  //Throw an arbitrary object
  // throw "An exception occurred here";

  // Handle OutOutLlamasException
  try {
    breedMoreLlamas();
  } on OutOfLlamasException {
    buyMoreLlamas();
  }

  try {
    breedMoreLlamas();
  } on OutOfLlamasException {
    // A specific exception
    buyMoreLlamas();
  } on Exception catch (e) {
    // Anything else that is an exception
    print("Unknown exception $e");
  } catch (e) {
    // No specified type, handles all
    print('Something really unknown $e');
  }

  try {
    breedMoreLlamas();
  } on Exception catch (e) {
    print('Exception details $e');
  } catch (e,s) {
    print('Exception details $e');
    print('Stack Trace $s');
  }

  // Partially handle exception
  try {
    misbehave();
  } catch (e) {
    print('main() finished handling ${e.runtimeType}.');
  }

  // Ensure that some code runs whether or not the exception is thrown
  // use finally block
  try {
    breedMoreLlamas();
  } on OutOfLlamasException catch (e) {
    print(e);
  } finally {
    cleanLlamasStals();
  }

}