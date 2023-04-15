

class _ArabicNumbers {
  static String convert(Object value) {
    assert(
      value is int || value is String,
      "The value object must be of type 'int' or 'String'.",
    );

      if (value is int) {
        return _toArabicNumbers(value.toString());
      } else {
        return _toArabicNumbers(value as String);
      }

  }

  static String _toArabicNumbers(String value) {
    return value
        .replaceAll('0', '٠')
        .replaceAll('1', '١')
        .replaceAll('2', '٢')
        .replaceAll('3', '٣')
        .replaceAll('4', '٤')
        .replaceAll('5', '٥')
        .replaceAll('6', '٦')
        .replaceAll('7', '٧')
        .replaceAll('8', '٨')
        .replaceAll('9', '٩');
  }
}

class _ArabicATime {
  static String convert(String value, ) {
    

      return _toArabicATime(value);

  }

  static String _toArabicATime(String value) {
    return value.replaceAll('pm', 'م').replaceAll('am', 'ص');
  }
}

extension IntExtensions on int {
  String get toArabicNumbers {
    return _ArabicNumbers.convert(this);
  }
}

extension StringExtensions on String {
  String get toArabicNumbers {
    return _ArabicNumbers.convert(this);
  }

  String get toArabicATime {
    return _ArabicATime.convert(this );
  }
}
