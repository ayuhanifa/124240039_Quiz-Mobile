import 'package:flutter/material.dart';

class PyramidScreen extends StatefulWidget {
  const PyramidScreen({super.key});

  @override
  State<PyramidScreen> createState() => _PyramidScreenState();
}

class _PyramidScreenState extends State<PyramidScreen> {
  final _sisiController = TextEditingController();
  final _tinggiController = TextEditingController();
  String _hasil = '';

  void _hitung() {
    double sisi = double.tryParse(_sisiController.text) ?? 0;
    double tinggi = double.tryParse(_tinggiController.text) ?? 0;
    double volume = (1 / 3) * (sisi * sisi) * tinggi;
    double kelilingAlas = 4 * sisi;
    
    setState(() {
      _hasil = 'Volume: ${volume.toStringAsFixed(2)}\nKeliling Alas: ${kelilingAlas.toStringAsFixed(2)}';
    });
  }

  InputDecoration _inputStyle(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF6B7280)),
      prefixIcon: Icon(icon, color: const Color(0xFF2F80ED)), // Vibrant Blue
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 18),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: Color(0xFF2F80ED), width: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text('Hitung Piramida')),
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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(controller: _sisiController, keyboardType: TextInputType.number, decoration: _inputStyle('Panjang Sisi Alas', Icons.straighten)),
                const SizedBox(height: 16),
                TextField(controller: _tinggiController, keyboardType: TextInputType.number, decoration: _inputStyle('Tinggi Piramida', Icons.height)),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: _hitung,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0A194A), // Deep Blue dari referensi
                      foregroundColor: Colors.white,
                      elevation: 10,
                      shadowColor: const Color(0xFF0A194A).withOpacity(0.5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text('Hitung Sekarang', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 30),
                if (_hasil.isNotEmpty)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [BoxShadow(color: const Color(0xFF2F80ED).withOpacity(0.15), blurRadius: 20, spreadRadius: 2)],
                    ),
                    child: Text(
                      _hasil, 
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Color(0xFF0A194A), height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}