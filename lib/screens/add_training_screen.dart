import 'package:flutter/material.dart';

class AddTrainingScreen extends StatefulWidget {
  final Function(Map<String, String>) onAdd;

  AddTrainingScreen({required this.onAdd});

  @override
  _AddTrainingScreenState createState() => _AddTrainingScreenState();
}

class _AddTrainingScreenState extends State<AddTrainingScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _setsController = TextEditingController();

  void _addExercise() {
    if (_nameController.text.isNotEmpty && _setsController.text.isNotEmpty) {
      final newExercise = {
        'name': _nameController.text,
        'sets': _setsController.text,
      };
      widget.onAdd(newExercise);
      Navigator.pop(context);
    } else {
      // Exibir uma mensagem de erro se os campos estiverem vazios
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor, preencha todos os campos!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Exercício'),
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
              onPressed: _addExercise,
              style: ElevatedButton.styleFrom(foregroundColor: Colors.red),
              child: Text('Adicionar Exercício'),
            ),
          ],
        ),
      ),
    );
  }
}
