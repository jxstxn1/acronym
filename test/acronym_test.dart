import 'package:acronym/acronym.dart';
import 'package:test/test.dart';

void main() {
  test(
      'Should throw an error if the given String only contains punctuation symbols',
      () {
    expect(() => Acronym.generateAcronym(','),
        throwsA(const TypeMatcher<ArgumentError>()));
    expect(() => Acronym.generateAcronym('!'),
        throwsA(const TypeMatcher<ArgumentError>()));
    expect(() => Acronym.generateAcronym('?'),
        throwsA(const TypeMatcher<ArgumentError>()));
    expect(() => Acronym.generateAcronym(';'),
        throwsA(const TypeMatcher<ArgumentError>()));
    expect(() => Acronym.generateAcronym('-'),
        throwsA(const TypeMatcher<ArgumentError>()));
    expect(() => Acronym.generateAcronym('_'),
        throwsA(const TypeMatcher<ArgumentError>()));
    expect(() => Acronym.generateAcronym('.'),
        throwsA(const TypeMatcher<ArgumentError>()));
    expect(() => Acronym.generateAcronym(' '),
        throwsA(const TypeMatcher<ArgumentError>()));
  });

  test('Should throw an error if the given String is empty', () {
    expect(() => Acronym.generateAcronym(''),
        throwsA(const TypeMatcher<ArgumentError>()));
  });
  group('Should create acronyms for "The United States of America"', () {
    const String input = "The United States of America";
    const List<String> stopWords = ["the", "of", "states"];
    test('should return "USA"', () {
      expect(Acronym.generateAcronym(input), equals('USA'));
    });
    test('should return "UA"', () {
      expect(
        Acronym.generateAcronym(input, stopWords: stopWords),
        equals('UA'),
      );
    });
  });

  group('Should create acronyms for "phntm.xyz/sidekick"', () {
    const String input = "phntm.xyz/sidekick";
    const List<String> stopWords = ["phntm", "xyz"];
    test('should return "PXS"', () {
      expect(Acronym.generateAcronym(input), equals('PXS'));
    });
    test('should return "S"', () {
      expect(
        Acronym.generateAcronym(input, stopWords: stopWords),
        equals('S'),
      );
    });
  });
}
