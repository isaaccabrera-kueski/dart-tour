// if statements only accepts boolean values
import 'dart:io';
import 'dart:math';

import 'package:characters/src/extensions.dart';

String getSeniority(int yearsOfExperience) {
  final String seniority;
  if (yearsOfExperience >= 10) {
    seniority = "Tech Lead";
  } else if (yearsOfExperience >= 5) {
    seniority = "Software Engineer III";
  } else if (yearsOfExperience >= 3) {
    seniority = "Software Engineer II";
  } else if (yearsOfExperience >= 1) {
    seniority = "Software Engineer I";
  } else if (yearsOfExperience == 0) {
    seniority = "Intern/Apprentice";
  } else {
    throw Exception("Invalid amount of years: $yearsOfExperience");
  }
  return "$seniority: $yearsOfExperience years of experience";
}

class Candidate {
  final int yearsOfExperience;

  Candidate(this.yearsOfExperience);

  void interview() {
    print("Interviewing candidate with $yearsOfExperience years of experience");
  }
}

const maxYearsOfExperience = 25;

int generateRandomExperience(int maxExperience) {
  return Random(DateTime
      .now()
      .microsecondsSinceEpoch
      .abs())
      .nextInt(maxExperience);
}

List<Candidate> generateCandidates(int amount) {
  return [
    for(var i = 0; i < amount; i++)
      Candidate(generateRandomExperience(maxYearsOfExperience))
  ];
}


class TransactionManager {
  static TransactionManager? instance;

  void executePending() {
    print("Executing transactions pending...");
  }

  void executeClosed() {
    print("Executing transactions closed...");
  }

  void executeOpen() {
    print("Executing transactions open...");
  }

  void executeUnknown() {
    print("Executing transactions unknown...");
  }

  TransactionManager._internal();

  static TransactionManager getInstance() {
    return instance ??= TransactionManager._internal();
  }
}

void main() {
  print("CONTROL FLOW \n");
  // if statement
  <int>[15, 8, 0, 2, 4, -3]
      .forEach((yearsOfExperience) {
    try {
      print(getSeniority(yearsOfExperience));
    } catch (e) {
      print(e);
    }
  });
  // For loops
  // traditional
  for (int i = 0; i < 4; i++) {
    int square = i * i;
    print("$i^2 = $square");
  }
  // foreach over an iterable
  String stringLetters = "isaac";
  for (var letter in stringLetters.characters) {
    print(letter);
  }
  // while
  var counter = 0;
  while (counter < 4) {
    print(counter);
    counter++;
  }
  // do while
  print("Enter your username:");
  //var username = stdin.readLineSync();
  var expectedPassword = "password";
  String pass;
  int attempts = 0;
  do {
    print("Type your password:");
    // pass = stdin.readLineSync() ?? "";
    if (++attempts == 3) {
      print("Max number of attempts reached $attempts");
      break; // break
    }
  } while (false /*pass != expectedPassword*/);

  var candidates = generateCandidates(20);
  for (final Candidate candidate in candidates) {
    if (candidate.yearsOfExperience > 5) {
      continue;
    } else {
      candidate.interview();
    }
  }
  // Switch and case
  var manager = TransactionManager.getInstance();
  var commands = const ["OPEN", "CLOSED", "PENDING", "BACKUP"];
  for (final String command in commands) {
    switch (command) {
      case "OPEN":
        manager.executeOpen();
        break;
      case "CLOSED":
        manager.executeClosed();
        break;
      case "PENDING":
        manager.executePending();
        break;
      default:
        manager.executeUnknown();
    }
  }
}