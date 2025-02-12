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


    //single number

        test('Single number returns the same number', () {
      expect(calculator.add('5'), 5);
    });

    //two numbers separated by comma

        test('Two numbers separated by comma should return their sum', () {
      expect(calculator.add('1,2'), 3);
    });

    //multiple numbers separated by comma

        test('Multiple numbers separated by comma should return their sum', () {
      expect(calculator.add('1,2,3,4,5'), 15);
    });



  });
}
