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

    //new line as delimiter

        test('New line as delimiter should return sum of numbers', () {
      expect(calculator.add('1\n2,3'), 6);
    });

    //custom delimiter for semicolon

      test('Custom delimiter (semicolon) should work', () {
      expect(calculator.add('//;\n1;2;3'), 6);
    });

    //custom delimiter for pipe

      test('Custom delimiter (pipe) should work', () {
      expect(calculator.add('//|\n1|2|3'), 6);
    });

    //multi line custom delimiter

      test('Multi-line custom delimiter should work', () {
      expect(calculator.add('//[***]\n1***2***3'), 6);
    });



  });
}
