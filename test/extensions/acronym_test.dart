import 'package:acronym/acronym.dart';
import 'package:test/test.dart';

void main() {
  test('Should return USA', () {
    const String input = 'The United States of America';
    final String output = input.acronym();
    expect(output, 'USA');
  });

  test('Should return UA', () {
    const String input = "The United States of America";
    final List<String> stopWords = [...EnglishStopWords().stopWordsWithNumbers, "states"];
    final String output = input.acronym(stopWords: stopWords);
    expect(output, 'UA');
  });
}
