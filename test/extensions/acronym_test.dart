import 'package:acronym/acronym.dart' as acr;
import 'package:test/test.dart';

void main() {
  test('Should return USA', () {
    const String input = 'The United States of America';
    final String output = input.toAcronym();
    expect(output, 'USA');
  });

  test('Should return UA', () {
    const String input = "The United States of America";
    final List<String> stopWords = [...acr.stopWords, "states"];
    final String output = input.toAcronym(stopWords: stopWords);
    expect(output, 'UA');
  });
}
