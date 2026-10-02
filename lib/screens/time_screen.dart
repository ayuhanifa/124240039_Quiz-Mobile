import 'package:flutter/material.dart';

class TimeScreen extends StatefulWidget {
  const TimeScreen({super.key});

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  TimeOfDay _wibTime = TimeOfDay.now();

  Future<void> _pilihWaktu() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _wibTime,
    );
    if (picked != null) {
      setState(() {
        _wibTime = picked;
      });
    }
  }

  Widget _timeBox(String label, String time, Color color, IconData icon) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(backgroundColor: color.withOpacity(0.2), child: Icon(icon, color: color)),
        title: Text(label, style: const TextStyle(fontSize: 16, color: Colors.grey)),
        subtitle: Text(time, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int malaysiaHour = (_wibTime.hour + 1) % 24;
    int kanadaHour = (_wibTime.hour - 12) % 24; 
    if (kanadaHour < 0) kanadaHour += 24;

    String formatTime(int h, int m) => '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';

    return Scaffold(
      appBar: AppBar(title: const Text('Konversi Waktu')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _timeBox('Waktu Indonesia (WIB)', _wibTime.format(context), Colors.blue, Icons.wb_sunny),
            const SizedBox(height: 10),
            _timeBox('Waktu Malaysia (MYT)', formatTime(malaysiaHour, _wibTime.minute), Colors.green, Icons.map),
            const SizedBox(height: 10),
            _timeBox('Waktu Kanada (EST)', formatTime(kanadaHour, _wibTime.minute), Colors.red, Icons.ac_unit),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.edit_calendar),
                label: const Text('Ubah Waktu WIB', style: TextStyle(fontSize: 18)),
                onPressed: _pilihWaktu,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}