import 'package:acronym/src/acronym_base.dart';

extension RemovePunctuation on String {
  /// Removes Punctioation from a string
  /// Example:
  ///    "Hello, World!" -> "Hello World"
  String removePunctuation() {
    const String regex =
        r'[^\p{Alphabetic}\p{Mark}\p{Decimal_Number}\p{Connector_Punctuation}\p{Join_Control}\s]+';
    return replaceAll(RegExp(regex, unicode: true), '');
  }
}

extension Tokenize on String {
  /// Tokenize a String
  /// Example:
  /// "Hello world i am foo"; -> ["Hello", "world", "i", "am", "foo"]
  List<String> tokenize({String separator = "s"}) {
    return split(RegExp('\\$separator+'));
  }
}

extension AcronymString on String {
  /// Create a acronym from a string
  /// Uses [EnglishStopWords][stopWords] as default
  ///
  /// Example:
  /// "The United States of America" -> "USA"
  String toAcronym({List<String>? stopWords, bool splitSyllables = false}) {
    return generateAcronym(
      this,
      stopWords: stopWords,
      splitSyllables: splitSyllables,
    );
  }
}

extension Syllables on String {
  List<String> toSyllable() {
    final RegExp syllableRegex =
        RegExp(r"[^aeiouy]*[aeiouy]+(?:[^aeiouy]*$|[^aeiouy](?=[^aeiouy]))?");
    final List<String> syllables = splitMapJoin(
      syllableRegex,
      onMatch: (m) => '${m[0]} ',
      onNonMatch: (n) => '$n ',
    ).split(' ')
      ..removeWhere((it) => it.isEmpty);
    return syllables;
  }
}
