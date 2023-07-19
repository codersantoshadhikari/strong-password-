// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SaveScreen extends StatefulWidget {
  final String generatedPassword;
  final List<String> savedPasswords;

  const SaveScreen(this.generatedPassword, this.savedPasswords, {Key? key})
      : super(key: key);

  @override
  _SaveScreenState createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  final TextEditingController _editingController = TextEditingController();
  bool _isEditing = false;
  int _editIndex = -1;

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  void _editPassword(int index, String password) {
    setState(() {
      _isEditing = true;
      _editIndex = index;
      _editingController.text = password;
    });
  }

  void _savePasswordEdit() {
    if (_editIndex != -1 && _editingController.text.isNotEmpty) {
      setState(() {
        widget.savedPasswords[_editIndex] = _editingController.text;
        _editIndex = -1;
        _isEditing = false;
        _editingController.text = '';
      });
    }
  }

  void _cancelPasswordEdit() {
    setState(() {
      _editIndex = -1;
      _isEditing = false;
      _editingController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo, // Dark blue app bar
        title: const Text('Saved Passwords',
            style: TextStyle(color: Colors.white)), // White title text
      ),
      backgroundColor: Colors.grey[200], // Light grey background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Saved Passwords:',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('No.')),
                      DataColumn(label: Text('Password')),
                      DataColumn(label: Text('Action')),
                    ],
                    rows: widget.savedPasswords.asMap().entries.map((entry) {
                      int index = entry.key + 1;
                      String password = entry.value;

                      return DataRow(cells: [
                        DataCell(Text(index.toString())),
                        DataCell(
                          _isEditing && _editIndex == index - 1
                              ? TextFormField(
                                  controller: _editingController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter new password',
                                  ),
                                )
                              : Text(password),
                        ),
                        DataCell(
                          _isEditing && _editIndex == index - 1
                              ? Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: _savePasswordEdit,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 8),
                                      ),
                                      child: const Text('Save'),
                                    ),
                                    const SizedBox(width: 8),
                                    ElevatedButton(
                                      onPressed: _cancelPasswordEdit,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 8),
                                      ),
                                      child: const Text('Cancel'),
                                    ),
                                  ],
                                )
                              : ElevatedButton(
                                  onPressed: () {
                                    _editPassword(index - 1, password);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                  ),
                                  child: const Text('Edit'),
                                ),
                        ),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Implement any action you want to perform when this button is pressed
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Teal button
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text(
                    'Do Something'), // Replace with your desired text
              ),
              // You can add more buttons or widgets here as needed
            ],
          ),
        ),
      ),
    );
  }
}
