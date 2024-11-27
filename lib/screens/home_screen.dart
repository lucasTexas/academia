import 'package:flutter/material.dart';
import 'training_screen.dart';
import 'employees_screen.dart';
import 'calendar_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home - Força e Forma'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrainingScreen()),
                );
              },
              style: ElevatedButton.styleFrom(foregroundColor: Colors.red),
              child: Text('Plano de Treinos'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EmployeesScreen()),
                );
              },
              style: ElevatedButton.styleFrom(foregroundColor: Colors.red),
              child: Text('Funcionários'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalendarScreen()),
                );
              },
              style: ElevatedButton.styleFrom(foregroundColor: Colors.red),
              child: Text('Calendário'),
            ),
          ],
        ),
      ),
    );
  }
}
