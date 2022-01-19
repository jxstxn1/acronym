import 'package:acronym/acronym.dart';
import 'package:acronym/src/stopwords.dart';
import 'package:test/test.dart';

void main() {
  test('Should throw an error if the given String only contains punctuation symbols', () {
    expect(
      () => generateAcronym(','),
      throwsA(const TypeMatcher<ArgumentError>()),
    );
    expect(
      () => generateAcronym('!'),
      throwsA(const TypeMatcher<ArgumentError>()),
    );
    expect(
      () => generateAcronym('?'),
      throwsA(const TypeMatcher<ArgumentError>()),
    );
    expect(
      () => generateAcronym(';'),
      throwsA(const TypeMatcher<ArgumentError>()),
    );
    expect(
      () => generateAcronym('-'),
      throwsA(const TypeMatcher<ArgumentError>()),
    );
    expect(
      () => generateAcronym('_'),
      throwsA(const TypeMatcher<ArgumentError>()),
    );
    expect(
      () => generateAcronym('.'),
      throwsA(const TypeMatcher<ArgumentError>()),
    );
    expect(
      () => generateAcronym(' '),
      throwsA(const TypeMatcher<ArgumentError>()),
    );
  });

  test('Should throw an error if the given String is empty', () {
    expect(
      () => generateAcronym(''),
      throwsA(const TypeMatcher<ArgumentError>()),
    );
  });

  test('Should return TUSOA', () {
    const String input = "The United States of America";
    expect(generateAcronym(input, stopWords: NoStopWords().stopWords), equals('TUSOA'));
  });
  group('Should create acronyms for "The United States of America"', () {
    const String input = "The United States of America";
    const List<String> stopWords = ["the", "of", "states"];
    test('should return "USA"', () {
      expect(generateAcronym(input), equals('USA'));
    });
    test('should return "UA"', () {
      expect(
        generateAcronym(input, stopWords: stopWords),
        equals('UA'),
      );
    });
  });

  group('Should create acronyms for "phntm.xyz/sidekick"', () {
    const String input = "phntm.xyz/sidekick";
    const List<String> stopWords = ["phntm", "xyz"];
    test('should return "PXS"', () {
      expect(generateAcronym(input), equals('PXS'));
    });
    test('should return "S"', () {
      expect(
        generateAcronym(input, stopWords: stopWords),
        equals('S'),
      );
    });
  });
}
