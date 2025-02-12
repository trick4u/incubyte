import 'dart:ui' as ui; // ✅ Fixes missing UI-related symbols
import 'package:flutter_test/flutter_test.dart';
import 'package:incubyte/logic.dart';


void main() {
  late StringCalculator calculator;

  setUp(() {
    calculator = StringCalculator();
  });

  group('StringCalculator Tests', () {
    test('Empty string should return 0', () {
      expect(calculator.add(''), 0);
    });


   });
}
