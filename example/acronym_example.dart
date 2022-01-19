// ignore_for_file: avoid_print

import 'package:acronym/acronym.dart';
import 'package:acronym/src/stopwords.dart';

void main() {
  const String input = "The United States of America";

  // Generate the acronym with the default Values
  final String output = Acronym.generateAcronym(input);
  print(output); // "USA"

  const List<String> stopWords = ["the", "of", "states"];

  // Generate the acronym with the [stopWords] to exlude the words ["the", "of", "states"]
  final String output2 = Acronym.generateAcronym(input, stopWords: stopWords);
  print(output2); // "UA"

  // Generate the acronym with the extension
  final String output3 = input.acronym();
  print(output3); // "USA"

  // Generate the acronym with the extension using the [stopWords] to exlude the words ["the", "of", "states"]
  final String output4 = input.acronym(stopWords: stopWords);
  print(output4); // "UA"

  EnglishStopWords().stopWords;
}
