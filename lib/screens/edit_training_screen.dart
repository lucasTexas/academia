import 'package:flutter/material.dart';

class EditTrainingScreen extends StatefulWidget {
  final Map<String, String> exercise;
  final Function(Map<String, String>) onSave;

  EditTrainingScreen({required this.exercise, required this.onSave});

  @override
  _EditTrainingScreenState createState() => _EditTrainingScreenState();
}

class _EditTrainingScreenState extends State<EditTrainingScreen> {
  late TextEditingController _nameController;
  late TextEditingController _setsController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.exercise['name']);
    _setsController = TextEditingController(text: widget.exercise['sets']);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _setsController.dispose();
    super.dispose();
  }

  void _saveExercise() {
    final updatedExercise = {
      'name': _nameController.text,
      'sets': _setsController.text,
    };
    widget.onSave(updatedExercise);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Exercício'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome do Exercício'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _setsController,
              decoration: InputDecoration(labelText: 'Séries e Repetições'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _saveExercise,
              style: ElevatedButton.styleFrom(foregroundColor: Colors.red),
              child: Text('Salvar Alterações'),
            ),
          ],
        ),
      ),
    );
  }
}
