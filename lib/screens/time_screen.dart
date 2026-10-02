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

  Widget _timeBox(String label, String time, Color iconColor, IconData icon) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shadowColor: const Color(0xFF2F80ED).withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: iconColor.withOpacity(0.15), shape: BoxShape.circle),
          child: Icon(icon, color: iconColor, size: 28),
        ),
        title: Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF6B7280))),
        subtitle: Text(time, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Color(0xFF0A194A))),
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text('Konversi Waktu')),
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
                _timeBox('Waktu Indonesia (WIB)', _wibTime.format(context), const Color(0xFF2F80ED), Icons.wb_sunny),
                const SizedBox(height: 16),
                _timeBox('Waktu Malaysia (MYT)', formatTime(malaysiaHour, _wibTime.minute), const Color(0xFF0A194A), Icons.map),
                const SizedBox(height: 16),
                _timeBox('Waktu Kanada (EST)', formatTime(kanadaHour, _wibTime.minute), const Color(0xFF6B7280), Icons.ac_unit),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.edit_calendar),
                    label: const Text('Ubah Waktu WIB', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    onPressed: _pilihWaktu,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0A194A),
                      foregroundColor: Colors.white,
                      elevation: 10,
                      shadowColor: const Color(0xFF0A194A).withOpacity(0.5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
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