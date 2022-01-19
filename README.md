A simple, lightweight and easy to use package to generate acronyms.

## Usage

You can use it with the standard arguments to generate your acronym:
```dart
import 'package:acronym/acronym.dart';

final String output = Acronym.generateAcronym(input);
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
final String output1 = input.acronym(stopWords: EnglishStopWords().stopWords);

final String output1 = Acronym.generateAcronym(input, stopWords: EnglishStopWords().stopWords);
print(output); // "USA"
```

Add your own stop words:
```dart
const String input = "The United States of America";
    final List<String> stopWords = [...EnglishStopWords().stopWordsWithNumbers, "states"];
    final String output = input.acronym(stopWords: stopWords);
    print(output); //UA
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
