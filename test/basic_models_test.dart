import 'package:flutter_test/flutter_test.dart';
import 'package:wirdi/services/prayer_times_service.dart';
import 'package:wirdi/services/quran_service.dart';
import 'package:wirdi/services/reciter_service.dart';
import 'package:wirdi/services/favorite_ayah_service.dart';
import 'package:wirdi/services/audio_download_service.dart';
void main(){test('reciter fallback',(){expect(ReciterService.getReciterById(999).id,7);});test('duration format',(){expect(PrayerTimesService.formatDuration(const Duration(hours:1,minutes:2,seconds:3)),'01:02:03');});test('normalize arabic',(){expect(QuranService.normalizeArabic('إِنَّا أَعْطَيْنَاكَ'),'انا اعطيناك');});test('favorite key',(){expect(FavoriteAyah(surahNumber:18,surahName:'الكهف',ayahNumber:10,text:'').key,'18:10');});test('download key',(){expect(DownloadedSurah(surahNumber:1,surahName:'الفاتحة',reciterId:7,reciterName:'M').key,'7:1');});}
