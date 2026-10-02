import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  final String urlFotoGoogleDrive = "https://drive.google.com/uc?export=view&id=1wY-R11zs3HRLBctSrCteUYB0joVDlPIV"; 

  Widget _buildInfoTile(IconData icon, String title, String subtitle) {
    return Card(
      color: Colors.white.withOpacity(0.9),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      elevation: 4,
      shadowColor: const Color(0xFF0A194A).withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: const Color(0xFF0A194A).withOpacity(0.08), shape: BoxShape.circle),
          child: Icon(icon, color: const Color(0xFF0A194A)),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF6B7280))),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 16, color: Color(0xFF0A194A), fontWeight: FontWeight.w700)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text('Profil Saya')),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF1F8FF), Color(0xFFCBE3FB)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: const Color(0xFF2F80ED).withOpacity(0.3), blurRadius: 20, spreadRadius: 5)
                      ]
                    ),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: const Color(0xFFD6E8FB),
                      backgroundImage: NetworkImage(urlFotoGoogleDrive),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Ayu Hanifa', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Color(0xFF0A194A))),
                const SizedBox(height: 24),
                _buildInfoTile(Icons.badge, 'NIM', '124240039'),
                _buildInfoTile(Icons.school, 'Program Studi', 'Sistem Informasi'),
                _buildInfoTile(Icons.cake, 'Tempat, Tanggal Lahir', 'Jakarta, 22 Februari 2006'),
                _buildInfoTile(Icons.favorite, 'Hobi', 'Menonton Film'),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}