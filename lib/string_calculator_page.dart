import 'package:flutter/material.dart';

import 'logic.dart';

class StringcalUI extends StatefulWidget {
  const StringcalUI({super.key});

  @override
  State<StringcalUI> createState() => _StringcalUIState();
}

class _StringcalUIState extends State<StringcalUI> {
  final _calculator = StringCalculator();
  final _controller = TextEditingController();
  String? _result;
  String? _error;

  void _calculate() {
    try {
      final result = _calculator.add(_controller.text);
      setState(() {
        _result = result.toString();
        _error = null;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _result = null;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('String Incubyte'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter numbers separated by commas',
                  helperText: 'Press enter to calculate',
                ),
                onEditingComplete: _calculate,
                onSubmitted: (_) => _calculate(),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: _calculate,
                child: const Text('Calculate'),
              ),
              const SizedBox(height: 24),
              if (_result != null)
                Card(
                  color: Colors.green.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Result',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _result!,
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (_error != null)
                Card(
                  color: Colors.red.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Error',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _error!,
                          style: TextStyle(
                            color: Colors.red.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Input Format:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('• Default (using commas): 1,2,3'),
                      Text('• With newlines: 1\\n2,3'),
                      Text(
                          '• Custom delimiter: //;\\n1;2;3 (specify delimiter after //)'),
                      SizedBox(height: 8),
                      Text(
                        'Note: To use any delimiter other than comma, you must specify it using the custom delimiter format',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
