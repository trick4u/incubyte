//logic part

import 'package:flutter/material.dart';

class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }
    String delimiter = ',';
    String numbersToProcess = numbers;

    //custom delimiter
    if (numbers.startsWith('//')) {
      var parts = numbers.split('\n');
      delimiter = parts[0].substring(2);
      numbersToProcess = parts[1];
    }
    numbersToProcess = numbersToProcess.replaceAll('\n', delimiter);

    List<int> nums = numbersToProcess
        .split(delimiter)
        .map((str) => int.parse(str.trim()))
        .toList();

    var negativeNumbers = nums.where((num) => num < 0).toList();
    if (negativeNumbers.isNotEmpty) {
      throw Exception(
          'negative numbers not allowed: ${negativeNumbers.join(',')}'); // Added colon and space
    }

    return nums.reduce((sum, num) => sum + num);
  }
}
