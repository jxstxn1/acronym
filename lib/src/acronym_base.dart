// ignore_for_file: avoid_classes_with_only_static_members

import 'package:acronym/src/extensions.dart';
import 'package:acronym/src/stopwords.dart';
import 'package:recase/recase.dart';

class Acronym {
  /// Generates a acronym out of the given String.
  ///
  /// [input] - The String to generate the acronym from.
  /// [stopWords] - A list of words to exclude from the acronym.
  ///
  /// Throws a [ArgumentError] if the [input] only contains punctuation symbols.
  ///
  /// Returns a String containing the acronym.
  static String generateAcronym(String input, {List<String>? stopWords}) {
    String acronym = '';
    final _stopWords = stopWords ?? EnglishStopWords().stopWords;
    final ReCase recase = ReCase(input);
    final titleCaseString = recase.titleCase;
    final clearedString = titleCaseString.removePunctuation();
    if (clearedString.isEmpty) {
      throw ArgumentError(
        'String contained no letters. Cannot create acronym. String: $input',
      );
    }
    final List<String> words = clearedString.tokenize();
    for (int i = 0; i < words.length; i++) {
      if (!_stopWords.contains(words[i].toLowerCase())) {
        acronym += words[i][0];
      }
    }
    return acronym;
  }
}
