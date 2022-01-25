// ignore_for_file: avoid_classes_with_only_static_members

import 'package:acronym/src/extensions.dart';
import 'package:acronym/src/stopwords.dart' as word;
import 'package:recase/recase.dart';

/// Generates a acronym out of the given String.
///
/// [input] - The String to generate the acronym from.
/// [stopWords] - A list of words to exclude from the acronym.
///
/// Throws a [ArgumentError] if the [input] only contains punctuation symbols.
///
/// Returns a String containing the acronym.
String generateAcronym(
  String input, {
  List<String>? stopWords,
  bool splitSyllables = false,
}) {
  final _stopWords = stopWords ?? word.stopWords;
  final ReCase recase = ReCase(input);
  final titleCaseString = recase.titleCase;
  final clearedString = titleCaseString.removePunctuation();
  if (clearedString.isEmpty) {
    throw ArgumentError(
      'String contained no letters. Cannot create acronym. String: $input',
    );
  }
  final List<String> tokenizedWords = clearedString.tokenize();
  final List<String> syllableWords = [];
  if (splitSyllables) {
    for (final element in tokenizedWords) {
      syllableWords.addAll(element.toSyllable());
    }
  } else {
    syllableWords.addAll(tokenizedWords);
  }
  final filtered = syllableWords
      .where((it) => !_stopWords.contains(it.toLowerCase()))
      .toList();
  final acronym = filtered.map((it) => it[0]).join();
  return acronym;
}
