import 'package:acronym/acronym.dart';

void main() {
  const String input = "The United States of America";

  // Generate the acronym with the default Values
  final String output = Acronym.generateAcronym(input);
  print(output); // "USA"

  // Generate the acronym with the [returnType] lowercase
  final String output2 = Acronym.generateAcronym(input, returnType: AcronymReturnType.lowercase);
  print(output2); // "usa"

  const List<String> stopWords = ["the", "of", "states"];

  // Generate the acronym with the [stopWords] to exlude the words ["the", "of", "states"]
  final String output3 = Acronym.generateAcronym(input, stopWords: stopWords);
  print(output3); // "UA"

  // Generate the acronym with the [stopWords] to exlude the words ["the", "of", "states"] and the [returnType] lowercase
  final String output4 = Acronym.generateAcronym(input, stopWords: stopWords, returnType: AcronymReturnType.lowercase);
  print(output4); // "ua"
}
