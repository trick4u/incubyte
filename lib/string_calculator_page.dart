import 'package:flutter/material.dart';

import 'logic.dart';

class StringcalUI extends StatefulWidget {
  const StringcalUI({super.key});

  @override
  State<StringcalUI> createState() => _StringcalUIState();
}

class _StringcalUIState extends State<StringcalUI> {
  final _controller = TextEditingController();
  String? _result;
  String? _error;

  void _calculate() {
    // try {
    //   // final result = _calculator.add(_controller.text);
    //   setState(() {
    //     _result = result.toString();
    //     _error = null;
    //   });
    // } catch (e) {
    //   setState(() {
    //     _error = e.toString();
    //     _result = null;
    //   });
    // }
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
                onSubmitted: (_) => _calculate(),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: _calculate,
                child: const Text('Calculate'),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
