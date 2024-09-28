import 'dart:math';

String generateRandomString() {
  final _random = Random();
  const _availableChars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final randomString = List.generate(20,
          (index) => _availableChars[_random.nextInt(_availableChars.length)])
      .join();

  return randomString;
}
