import 'package:acronym/src/extensions.dart';
import 'package:test/test.dart';

void main() {
  test('Should tokenize a given String', () {
    const str = 'Hello World!';
    final List<String> tokens = str.tokenize();
    expect(tokens, equals(['Hello', 'World!']));
  });

  test('Should tokenize a given String with a custom delimiter', () {
    const str = 'Hello,World!';
    final List<String> tokens = str.tokenize(separator: ',');
    expect(tokens, equals(['Hello', 'World!']));
  });
}
