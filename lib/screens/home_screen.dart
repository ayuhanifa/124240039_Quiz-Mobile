import 'package:flutter/material.dart';
import 'pyramid_screen.dart';
import 'triangle_screen.dart';
import 'time_screen.dart';
import 'day_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildMenuCard(BuildContext context, String title, IconData icon, Widget destination, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => destination)),
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 40, color: color),
            ),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Utama')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildMenuCard(context, 'Piramida', Icons.change_history, const PyramidScreen(), Colors.orange),
            _buildMenuCard(context, 'Segitiga', Icons.architecture, const TriangleScreen(), Colors.green),
            _buildMenuCard(context, 'Waktu', Icons.access_time, const TimeScreen(), Colors.blue),
            _buildMenuCard(context, 'Cek Hari', Icons.calendar_today, const DayScreen(), Colors.red),
          ],
        ),
      ),
    );
  }
}