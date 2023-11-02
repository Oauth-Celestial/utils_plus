extension StringEtension on String {
  String get uppercase => toUpperCase();

  String get lowercase => toLowerCase();

  String get removeWhiteSpace => trim();

  // print(text.capitalizeFirstLetter()); // Output: "Hello world"
  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

//   print(text.capitalizeWords());       // Output: "Hello World"
  String capitalizeWords() {
    List<String> words = split(" ");
    List<String> capitalizedWords = words.map((word) {
      return word.capitalizeFirstLetter();
    }).toList();
    return capitalizedWords.join(" ");
  }

// int parsedInt = numericString.parseIntOrDefault(0); // Output: 123
  int parseIntOrDefault(int defaultValue) {
    try {
      return int.parse(this);
    } catch (e) {
      return defaultValue;
    }
  }

// double parsedDouble = doubleString.parseDoubleOrDefault(0.0); // Output: 3.14
  double parseDoubleOrDefault(double defaultValue) {
    try {
      return double.parse(this);
    } catch (e) {
      return defaultValue;
    }
  }

  String removeAll(String substring) {
    return replaceAll(substring, '');
  }

  bool isAlphanumeric() {
    final alphanumericRegex = RegExp(r'^[a-zA-Z0-9]+$');
    return alphanumericRegex.hasMatch(this);
  }

  String removeHtmlTags() {
    return replaceAll(RegExp(r'<[^>]*>'), '');
  }

  List<String> splitOn({required String character}) {
    return split(character);
  }

  bool isValidEmail() {
    final RegExp emailRegExp = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
      caseSensitive: false,
    );
    return emailRegExp.hasMatch(this);
  }

  bool isValidUrl() {
    final RegExp urlRegExp = RegExp(
      r'^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$',
      caseSensitive: false,
    );
    return urlRegExp.hasMatch(this);
  }

  String detectDateFormat() {
    Map<String, String> regexWithFormat = {
      r'\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}': "yyyy-MM-dd HH:mm:ss",
      r'\w{3}, \w{3} \d{1,2}, \d{2}': "EEE, MMM d, 'yy",
      r'\w+ \d{1,2}, \d{4}': "MMMM dd, yyyy",
      r'\d{2}/\d{2}/\d{4}': "MM/dd/yyyy",
      r'\d{2}-\d{2}-\d{4}': "dd-MM-yyyy",
      r'\d{2}:\d{2} [APap][Mm]': "hh:mm a",
      r'\w+ \d{4}': "MMMM yyyy",
      r'\w{3}, \d{1,2} \w{3} \d{4}': "EEE, dd MMM yyyy HH:mm:ss",
      r'\d{2}/\d{2}/\d{4} \d{2}:\d{2}:\d{2}': "dd/MM/yyyy HH:mm:ss",
      r'\d{4}-\d{2}-\d{2}': "yyyy-MM-dd", //(Date only)
      r'\d{1,2} \w{3} \d{4}': " d MMM yyyy", // (e.g., 22 Sep 2023)
      r'\w{3}, \d{1,2} \w{3} \d{2}': "EEE, d MMM 'yy", //(e.g., Fri, 22 Sep '23)
      r'\d{2}:\d{2}': "HH:mm", // (Time only)
      r'\d{1,2}/\d{1,2}/\d{2}': "M/d/yy", // (e.g., 9/22/23)
      r'\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}': "yyyy-MM-ddTHH:mm:ss",
      r'\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z': "yyyy-MM-ddTHH:mm:ssZ"
    };

    for (final entry in regexWithFormat.entries) {
      final regex = RegExp(entry.key);
      if (regex.hasMatch(this)) {
        return entry.value;
      }
    }

    return 'Unknown Date Format';
  }
}
