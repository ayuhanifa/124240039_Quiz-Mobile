import 'package:flutter/material.dart';

class DayScreen extends StatefulWidget {
  const DayScreen({super.key});

  @override
  State<DayScreen> createState() => _DayScreenState();
}

class _DayScreenState extends State<DayScreen> {
  final _inputController = TextEditingController();
  String _hasilHari = '';

  void _cekHari() {
    int? nomor = int.tryParse(_inputController.text);
    switch (nomor) {
      case 1: _hasilHari = 'Senin'; break;
      case 2: _hasilHari = 'Selasa'; break;
      case 3: _hasilHari = 'Rabu'; break;
      case 4: _hasilHari = 'Kamis'; break;
      case 5: _hasilHari = 'Jumat'; break;
      case 6: _hasilHari = 'Sabtu'; break;
      case 7: _hasilHari = 'Minggu'; break;
      default: _hasilHari = 'Input Tidak Valid!';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text('Cek Hari')),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Masukkan angka 1 sampai 7',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFF0A194A)),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _inputController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF0A194A)),
                  decoration: InputDecoration(
                    hintText: 'Contoh: 1',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 20),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: const BorderSide(color: Color(0xFF2F80ED), width: 2)),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: _cekHari,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0A194A), // Deep Blue
                      foregroundColor: Colors.white,
                      elevation: 10,
                      shadowColor: const Color(0xFF0A194A).withOpacity(0.5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text('Cari Hari', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 40),
                if (_hasilHari.isNotEmpty)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [BoxShadow(color: const Color(0xFF2F80ED).withOpacity(0.15), blurRadius: 20, spreadRadius: 5)],
                    ),
                    child: Column(
                      children: [
                        const Text('Hari:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF6B7280))),
                        const SizedBox(height: 8),
                        Text(
                          _hasilHari,
                          style: TextStyle(
                            fontSize: 38, 
                            fontWeight: FontWeight.w900, 
                            color: _hasilHari == 'Input Tidak Valid!' ? Colors.redAccent : const Color(0xFF0A194A)
                          ),
                        ),
                      ],
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