import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio_background/just_audio_background.dart';

import 'pages/dashboard_page.dart';
import 'pages/quran_page.dart';
import 'pages/tasbeeh_page.dart';
import 'pages/more_page.dart';
import 'services/notification_service.dart';
import 'services/theme_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeService.instance.loadTheme();
  try {
    await JustAudioBackground.init(
      androidNotificationChannelId: 'com.wirdi.audio',
      androidNotificationChannelName: 'Wirdi Quran Audio',
      androidNotificationOngoing: true,
    );
  } catch (_) {}
  try {
    await NotificationService.initialize();
  } catch (_) {}
  runApp(const WirdiApp());
  unawaited(NotificationService.scheduleAzkarNotificationsByPrayerTimes().catchError((_) {}));
}

class WirdiApp extends StatelessWidget {
  const WirdiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ThemeService.instance,
      builder: (context, _) {
        return MaterialApp(
          title: 'Wirdi',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            textTheme: GoogleFonts.cairoTextTheme(),
            scaffoldBackgroundColor: const Color(0xFFF8FAF6),
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0F766E), brightness: Brightness.light),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            textTheme: GoogleFonts.cairoTextTheme(ThemeData.dark().textTheme),
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4CAF50), brightness: Brightness.dark),
          ),
          themeMode: ThemeService.instance.themeMode,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('ar'), Locale('en')],
          home: const MainNavigationPage(),
        );
      },
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});
  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int currentIndex = 0;
  final pages = const [DashboardPage(), QuranPage(), TasbeehPage(), MorePage()];
  final titles = const ['الرئيسية', 'القرآن الكريم', 'عداد التسبيح', 'المزيد'];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text(titles[currentIndex], style: const TextStyle(fontWeight: FontWeight.bold))),
        body: IndexedStack(index: currentIndex, children: pages),
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (i) => setState(() => currentIndex = i),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'الرئيسية'),
            NavigationDestination(icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book), label: 'القرآن'),
            NavigationDestination(icon: Icon(Icons.fingerprint_outlined), selectedIcon: Icon(Icons.fingerprint), label: 'التسبيح'),
            NavigationDestination(icon: Icon(Icons.more_horiz), selectedIcon: Icon(Icons.more), label: 'المزيد'),
          ],
        ),
      ),
    );
  }
}
