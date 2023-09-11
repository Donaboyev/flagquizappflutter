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

  void _checkAnswer() {
    switch (_selectedIndex) {
      case 0:
        if (questions[_questionIndex].variantTrue ==
            questions[_questionIndex].variantA) {
          setState(() {
            _trueIndex = 0;
          });
        }
        break;
      case 1:
        if (questions[_questionIndex].variantTrue ==
            questions[_questionIndex].variantB) {
          setState(() {
            _trueIndex = 1;
          });
        }
        break;
      case 2:
        if (questions[_questionIndex].variantTrue ==
            questions[_questionIndex].variantC) {
          setState(() {
            _trueIndex = 2;
          });
        }
        break;
      default:
        if (questions[_questionIndex].variantTrue ==
            questions[_questionIndex].variantD) {
          setState(() {
            _trueIndex = 3;
          });
        }
        break;
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
                ),
                const SizedBox(height: 20),
                VariantButton(
                  isSelected: _selectedIndex == 1,
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
                  backgroundColor: Colors.green,
                  minimumSize: const Size.fromHeight(56),
                ),
                onPressed: () {
                  if (_selectedIndex < 0) {
                    return;
                  }
                  _checkAnswer();
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
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
