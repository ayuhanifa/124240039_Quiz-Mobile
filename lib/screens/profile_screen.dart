import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  final String urlFotoGoogleDrive = "https://drive.google.com/uc?export=view&id=1wY-R11zs3HRLBctSrCteUYB0joVDlPIV"; 

  Widget _buildInfoTile(IconData icon, String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 16)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Saya')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Center(
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: NetworkImage(urlFotoGoogleDrive),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Ayu Hanifa', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildInfoTile(Icons.badge, 'NIM', '124240039'),
            _buildInfoTile(Icons.school, 'Program Studi', 'Sistem Informasi'),
            _buildInfoTile(Icons.cake, 'Tempat, Tanggal Lahir', 'Jakarta, 22 Februari 2006'),
            _buildInfoTile(Icons.favorite, 'Hobi', 'Menonton Film'),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}