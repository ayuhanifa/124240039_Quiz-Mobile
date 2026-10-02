import 'package:flutter/material.dart';
import 'pyramid_screen.dart';
import 'triangle_screen.dart';
import 'time_screen.dart';
import 'day_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildMenuCard(BuildContext context, String title, IconData icon, Widget destination, Color color) {
    return Card(
      color: Colors.white.withOpacity(0.95), // Efek sedikit transparan (glassy)
      elevation: 6,
      shadowColor: const Color(0xFF2F80ED).withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => destination)),
        borderRadius: BorderRadius.circular(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: color.withOpacity(0.2), blurRadius: 10, spreadRadius: 2)
                ]
              ),
              child: Icon(icon, size: 45, color: color),
            ),
            const SizedBox(height: 16),
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[800]), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Membuat gradasi menyatu hingga ke status bar
      appBar: AppBar(title: const Text('Menu Utama')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF1F8FF), Color(0xFFCBE3FB)], // Gradasi Soft Blue
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: [
                _buildMenuCard(context, 'Pyramid', Icons.change_history, const PyramidScreen(), Colors.orange),
                _buildMenuCard(context, 'Triangle', Icons.architecture, const TriangleScreen(), Colors.green),
                _buildMenuCard(context, 'Time', Icons.access_time, const TimeScreen(), Colors.blue),
                _buildMenuCard(context, 'Day', Icons.calendar_today, const DayScreen(), Colors.redAccent),
              ],
            ),
          ),
        ),
      ),
    );
  }
}