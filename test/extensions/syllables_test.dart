import 'package:acronym/src/extensions.dart';
import 'package:test/test.dart';

void main() {
  test('should return a list where the String is splitted in it syllables', () {
    const String input = 'The United States of America';
    final List<String> output = input.toSyllable();
    expect(output, [
      'The',
      'Uni',
      'ted',
      'Sta',
      'tes',
      'of',
      'Ame',
      'ri',
      'ca',
    ]);
  });

  test('should return a list where the String is splitted in it syllables', () {
    const String input = 'phntm.xyz/sidekick';
    final List<String> output = input.toSyllable();
    expect(output, ['phntm.xyz', '/si', 'de', 'kick']);
  });
}
