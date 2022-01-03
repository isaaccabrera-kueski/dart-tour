
class OutOfLlamasException implements Exception {
  final String message;
  OutOfLlamasException(this.message) : super();
}

void breedMoreLlamas() => print("Breed more llamas");

void buyMoreLlamas() => print("Buy more llamas");

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
}