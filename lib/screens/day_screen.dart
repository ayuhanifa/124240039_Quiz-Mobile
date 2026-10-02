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
      appBar: AppBar(title: const Text('Cek Hari')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Masukkan angka 1 sampai 7',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: 'Contoh: 1',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _cekHari,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text('Cari Hari', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 40),
            if (_hasilHari.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.redAccent.withOpacity(0.5), width: 2),
                ),
                child: Column(
                  children: [
                    const Text('Hari:', style: TextStyle(fontSize: 16, color: Colors.grey)),
                    Text(
                      _hasilHari,
                      style: TextStyle(
                        fontSize: 32, 
                        fontWeight: FontWeight.bold, 
                        color: _hasilHari == 'Input Tidak Valid!' ? Colors.red : Colors.deepPurple
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}