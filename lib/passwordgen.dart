import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'savescreen.dart';

class PasswordGeneratorScreen extends StatefulWidget {
  const PasswordGeneratorScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PasswordGeneratorScreenState createState() =>
      _PasswordGeneratorScreenState();
}

class _PasswordGeneratorScreenState extends State<PasswordGeneratorScreen> {
  String generatedPassword = '';
  int passwordLength = 12;
  bool includeUppercase = true;
  bool includeLowercase = true;
  bool includeNumbers = true;
  bool includeSpecialCharacters = true;
  List<String> savedPasswords = []; // List to hold all the saved passwords

  final TextEditingController _lengthController = TextEditingController();

  void generatePassword() {
    final random = Random();
    String charset = '';

    if (includeUppercase) {
      charset += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    }
    if (includeLowercase) {
      charset += 'abcdefghijklmnopqrstuvwxyz';
    }
    if (includeNumbers) {
      charset += '0123456789';
    }
    if (includeSpecialCharacters) {
      charset += '!@#\$%^&*()';
    }

    String password = '';

    for (int i = 0; i < passwordLength; i++) {
      password += charset[random.nextInt(charset.length)];
    }

    setState(() {
      generatedPassword = password;
    });
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: generatedPassword));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password copied to clipboard')),
    );
  }

  void savePassword() {
    if (generatedPassword.isNotEmpty) {
      setState(() {
        savedPasswords.add(
            generatedPassword); // Add the generated password to the savedPasswords list
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return SaveScreen(generatedPassword, savedPasswords);
          },
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _lengthController.text = passwordLength.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 73, 67, 158),
        title: const Center(
          child: Text(
            "Password Generator",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 10, 10, 9),
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 67, 62, 134),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 25),
          const Text(
            'Generated Password:',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SelectableText(
            generatedPassword,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: copyToClipboard,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text('Copy'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: generatePassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text('Generate Password'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: savePassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                ),
                child: const Column(
                  children: [
                    SizedBox(child: Text('save ')),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Text(
            'Password Length:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _lengthController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {
                      setState(() {
                        passwordLength = int.tryParse(value) ?? 0;
                      });
                    },
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(height: 16),
          ),
          const Text(
            'Options:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          CheckboxListTile(
            title: const Text(
              'Include Uppercase',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            value: includeUppercase,
            onChanged: (value) {
              setState(() {
                includeUppercase = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Include Lowercase',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            value: includeLowercase,
            onChanged: (value) {
              setState(() {
                includeLowercase = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Include Numbers',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            value: includeNumbers,
            onChanged: (value) {
              setState(() {
                includeNumbers = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: const Text(
              'Include Special Characters',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            value: includeSpecialCharacters,
            onChanged: (value) {
              setState(() {
                includeSpecialCharacters = value ?? false;
              });
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
