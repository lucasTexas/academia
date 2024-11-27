import 'package:flutter/material.dart';
import 'edit_training_screen.dart';
import 'add_training_screen.dart';

class TrainingScreen extends StatefulWidget {
  @override
  _TrainingScreenState createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  List<Map<String, String>> _exercises = [
    {'name': 'Agachamento', 'sets': '3x10'},
    {'name': 'Supino', 'sets': '3x12'},
    {'name': 'Bíceps com Halteres', 'sets': '3x15'},
  ];

  void _updateExercise(int index, Map<String, String> updatedExercise) {
    setState(() {
      _exercises[index] = updatedExercise;
    });
  }

  void _addExercise(Map<String, String> newExercise) {
    setState(() {
      _exercises.add(newExercise);
    });
  }

  void _removeExercise(int index) {
    setState(() {
      _exercises.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plano de Treino'),
        backgroundColor: Colors.red,
      ),
      body: _exercises.isEmpty
          ? Center(
              child: Text(
                'Nenhum exercício adicionado.',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: _exercises.length,
              itemBuilder: (context, index) {
                final exercise = _exercises[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(exercise['name']!),
                    subtitle: Text('Séries: ${exercise['sets']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditTrainingScreen(
                                  exercise: exercise,
                                  onSave: (updatedExercise) {
                                    _updateExercise(index, updatedExercise);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            _confirmRemoveExercise(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTrainingScreen(
                onAdd: (newExercise) {
                  _addExercise(newExercise);
                },
              ),
            ),
          );
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
    );
  }

  void _confirmRemoveExercise(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar Exclusão'),
          content: Text('Deseja realmente remover este exercício?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(foregroundColor: Colors.red),
              onPressed: () {
                _removeExercise(index);
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: Text('Excluir'),
            ),
          ],
        );
      },
    );
  }
}
