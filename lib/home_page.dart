import 'package:flagquizapp/question.dart';
import 'package:flagquizapp/variant_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String name;

  const HomePage({super.key, required this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _questionIndex = 0;
  int _selectedIndex = -1;
  int _trueIndex = -1;
  int _falseIndex = -1;

  void _checkAnswer() {
    if (questions[_questionIndex].variantTrue ==
        questions[_questionIndex].variantA) {
      setState(() {
        _trueIndex = 0;
        _falseIndex = _selectedIndex;
      });
    } else if (questions[_questionIndex].variantTrue ==
        questions[_questionIndex].variantB) {
      setState(() {
        _trueIndex = 1;
        _falseIndex = _selectedIndex;
      });
    } else if (questions[_questionIndex].variantTrue ==
        questions[_questionIndex].variantC) {
      setState(() {
        _trueIndex = 2;
        _falseIndex = _selectedIndex;
      });
    } else {
      setState(() {
        _trueIndex = 3;
        _falseIndex = _selectedIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  'What country does this flag belong to?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  questions[_questionIndex].imagePath,
                  width: 200,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: (_questionIndex + 1) / questions.length,
                        color: Colors.greenAccent,
                        backgroundColor: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      '${_questionIndex + 1}/${questions.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                VariantButton(
                  name: questions[_questionIndex].variantA,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  isSelected: _selectedIndex == 0,
                  isTrue: _trueIndex == 0,
                  isFalse: _falseIndex == 0,
                ),
                const SizedBox(height: 20),
                VariantButton(
                  isSelected: _selectedIndex == 1,
                  isFalse: _falseIndex == 1,
                  isTrue: _trueIndex == 1,
                  name: questions[_questionIndex].variantB,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                ),
                const SizedBox(height: 20),
                VariantButton(
                  isSelected: _selectedIndex == 2,
                  isTrue: _trueIndex == 2,
                  isFalse: _falseIndex == 2,
                  name: questions[_questionIndex].variantC,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                ),
                const SizedBox(height: 20),
                VariantButton(
                  isSelected: _selectedIndex == 3,
                  isFalse: _falseIndex == 3,
                  isTrue: _trueIndex == 3,
                  name: questions[_questionIndex].variantD,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: (_selectedIndex != -1 && _trueIndex != -1)
                      ? Colors.indigo
                      : Colors.green,
                  minimumSize: const Size.fromHeight(56),
                ),
                onPressed: () {
                  if (_selectedIndex != -1 && _trueIndex != -1) {
                    setState(() {
                      _questionIndex++;
                      _selectedIndex = -1;
                      _trueIndex = -1;
                      _falseIndex = -1;
                    });
                    return;
                  }

                  if (_selectedIndex < 0) {
                    return;
                  }
                  _checkAnswer();
                },
                child: Text(
                  (_selectedIndex != -1 && _trueIndex != -1)
                      ? 'Go to the next question'
                      : 'Submit',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
