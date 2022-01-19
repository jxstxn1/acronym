A simple, lightweight and easy to use package to generate acronyms.

## Usage

You can use it with the standard arguments to generate your acronym:
```dart
import 'package:acronym/acronym.dart';

final String output = generateAcronym(input);
print(output); // "USA"
```

Sample usage with the extension:
```dart
import 'package:acronym/acronym.dart';
const String input = "The United States of America";
final String output = input.acronym();
print(output); // "USA"
```

You can use it with stop words like this:
```dart
import 'package:acronym/acronym.dart';

const String input = "The United States of America";
final String output1 = input.acronym(stopWords: stopWords);

final String output1 = generateAcronym(input, stopWords: stopWords);
print(output); // "USA"
```

Add your own stop words:
```dart
const String input = "The United States of America";
final List<String> stopWords = [...stopWords, "states"];
final String output = input.acronym(stopWords: stopWords);
print(output); //UA
```

If you want to generate the Acronym without any words you can do it like this
```dart
const String input = "The United States of America";
final String output = input.acronym(stopWords: []);
print(output); //TUSOA
```
