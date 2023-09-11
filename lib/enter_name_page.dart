import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'home_page.dart';

class EnterNamePage extends StatefulWidget {
  const EnterNamePage({super.key});

  @override
  State<EnterNamePage> createState() => _EnterNamePageState();
}

class _EnterNamePageState extends State<EnterNamePage> {
  String _name = '';
  bool _isError = false;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Flags quiz',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  const Text(
                    'Please enter your name',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    onChanged: (value) {
                      /// '     fsdkljjfks    '
                      /// 'fsdkljjfks'
                      _name = value.trim();
                      if (_isError) {
                        setState(() {
                          _isError = false;
                        });
                      }
                    },
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      errorText: _isError
                          ? 'Name should contain at least 3 characters'
                          : null,
                      label: const Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      minimumSize: const Size(double.infinity, 46),
                      elevation: 0,
                    ),
                    onPressed: () {
                      if (_name.length > 2) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HomePage(name: _name),
                          ),
                        );
                      } else {
                        setState(() {
                          _isError = true;
                        });
                      }
                    },
                    child: Text(
                      'Start'.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
