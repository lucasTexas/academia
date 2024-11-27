import 'package:flutter/material.dart';

class EmployeesScreen extends StatelessWidget {
  final List<String> _employees = [
    'João Silva',
    'Maria Souza',
    'Carlos Alberto',
    'Ana Paula',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolha seu Treinador'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: _employees.length,
        itemBuilder: (context, index) {
          final employee = _employees[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text(
                  employee[0], // Primeira letra do nome
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text(employee),
              trailing: IconButton(
                icon: Icon(Icons.person_add),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$employee selecionado como treinador!'),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
