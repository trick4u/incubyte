class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    try {
      String delimiter = ','; // Default delimiter
      String numbersToProcess = numbers;

      if (numbers.startsWith('//')) {
        var parts = numbers.split('\n');
        if (parts.length < 2) {
          throw FormatException(
              'Invalid format. Correct format: //delimiter\\nnumbers\nExample: //;\\n1;2;3');
        }

        // Extract delimiter
        String delimiterSection = parts[0].substring(2);
        if (delimiterSection.startsWith('[') && delimiterSection.endsWith(']')) {
          delimiter = RegExp.escape(delimiterSection.substring(1, delimiterSection.length - 1));
        } else {
          delimiter = RegExp.escape(delimiterSection);
        }

        numbersToProcess = parts.sublist(1).join('\n'); // Keep everything after the first newline
      }

      // Split using both newline and the extracted delimiter
      List<int> nums = numbersToProcess
          .split(RegExp('[\n$delimiter]'))
          .where((str) => str.trim().isNotEmpty)
          .map((str) {
            try {
              return int.parse(str.trim());
            } catch (e) {
              throw FormatException('Invalid number: "$str"');
            }
          })
          .where((num) => num <= 1000) // ✅ Ignore numbers > 1000
          .toList();

      // Handle negative numbers
      var negativeNumbers = nums.where((num) => num < 0).toList();
      if (negativeNumbers.isNotEmpty) {
        throw Exception('Negative numbers not allowed: ${negativeNumbers.join(',')}');
      }

      return nums.reduce((sum, num) => sum + num);
    } catch (e) {
      rethrow;
    }
  }
}
