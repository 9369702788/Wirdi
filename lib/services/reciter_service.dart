import 'package:shared_preferences/shared_preferences.dart';
class Reciter { final int id; final String name; final String style; final String language; const Reciter({required this.id, required this.name, required this.style, required this.language}); }
class ReciterService {
  static const String _key = 'selected_reciter_id';
  static const List<Reciter> reciters = [
    Reciter(id: 7, name: 'Mishari Rashid Alafasy', style: 'Murattal', language: 'ar'),
    Reciter(id: 6, name: 'Mahmoud Khalil Al-Husary', style: 'Murattal', language: 'ar'),
    Reciter(id: 3, name: 'Abdur-Rahman As-Sudais', style: 'Murattal', language: 'ar'),
    Reciter(id: 9, name: 'Mohamed Siddiq Al-Minshawi', style: 'Murattal', language: 'ar'),
  ];
  static Future<int> getSelectedReciterId() async { final p = await SharedPreferences.getInstance(); return p.getInt(_key) ?? 7; }
  static Future<void> setSelectedReciterId(int id) async { final p = await SharedPreferences.getInstance(); await p.setInt(_key, id); }
  static Reciter getReciterById(int id) => reciters.firstWhere((r) => r.id == id, orElse: () => reciters.first);
}
