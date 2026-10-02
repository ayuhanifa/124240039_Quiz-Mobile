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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hitung Segitiga')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _tipe,
                  isExpanded: true,
                  items: ['Sama Sisi', 'Sama Kaki', 'Siku-siku']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) => setState(() => _tipe = val!),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _alasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Panjang Alas (atau Sisi)',
                prefixIcon: const Icon(Icons.horizontal_rule),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _tinggiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tinggi Segitiga',
                prefixIcon: const Icon(Icons.height),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _hitung,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text('Hitung Sekarang', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 30),
            if (_hasil.isNotEmpty)
              Card(
                color: Colors.green[50],
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    _hasil, 
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}