import 'package:flutter/material.dart';
import 'dart:math';

class TriangleScreen extends StatefulWidget {
  const TriangleScreen({super.key});

  @override
  State<TriangleScreen> createState() => _TriangleScreenState();
}

class _TriangleScreenState extends State<TriangleScreen> {
  String _tipe = 'Sama Sisi';
  final _alasController = TextEditingController();
  final _tinggiController = TextEditingController();
  String _hasil = '';

  void _hitung() {
    double alas = double.tryParse(_alasController.text) ?? 0;
    double tinggi = double.tryParse(_tinggiController.text) ?? 0;
    double luas = 0.5 * alas * tinggi;
    double keliling = 0;

    if (_tipe == 'Sama Sisi') {
      keliling = 3 * alas; 
    } else if (_tipe == 'Sama Kaki') {
      double sisiMiring = sqrt(pow(alas / 2, 2) + pow(tinggi, 2));
      keliling = alas + (2 * sisiMiring);
    } else if (_tipe == 'Siku-siku') {
      double sisiMiring = sqrt(pow(alas, 2) + pow(tinggi, 2));
      keliling = alas + tinggi + sisiMiring;
    }

    setState(() {
      _hasil = 'Luas: ${luas.toStringAsFixed(2)}\nKeliling: ${keliling.toStringAsFixed(2)}';
    });
  }

  InputDecoration _inputStyle(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF6B7280)),
      prefixIcon: Icon(icon, color: const Color(0xFF2F80ED)),
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
      appBar: AppBar(title: const Text('Hitung Segitiga')),
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _tipe,
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF2F80ED)),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0A194A)),
                      items: ['Sama Sisi', 'Sama Kaki', 'Siku-siku']
                          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (val) => setState(() => _tipe = val!),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(controller: _alasController, keyboardType: TextInputType.number, decoration: _inputStyle('Panjang Alas (atau Sisi)', Icons.horizontal_rule)),
                const SizedBox(height: 16),
                TextField(controller: _tinggiController, keyboardType: TextInputType.number, decoration: _inputStyle('Tinggi Segitiga', Icons.height)),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: _hitung,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0A194A), // Deep Blue
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