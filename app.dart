import 'package:flutter/material.dart';

import 'features/welcome/presentation/welcome_screen.dart';
import 'l10n/locale_provider.dart';

/// The root widget of the ATS AI Police Station Citizen Assistance Kiosk.
/// It holds the current locale for the app session and passes it down via
/// `LocaleProvider`. The UI uses a high‑contrast theme (Indigo primary, Orange
/// accent).
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // Default locale is English.
  String _localeCode = 'en';

  void _updateLocale(String code) {
    setState(() {
      _localeCode = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    // High‑contrast theme using the recommended colours.
    final ThemeData base = ThemeData.light();
    final Color primary = const Color(0xFF3F51B5); // Indigo
    final Color accent = const Color(0xFFFF9800); // Orange
    final ThemeData theme = base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: primary,
        secondary: accent,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: base.textTheme.apply(
        bodyColor: Colors.black87,
        displayColor: Colors.black87,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

    return LocaleProvider(
      localeCode: _localeCode,
      updateLocale: _updateLocale,
      child: MaterialApp(
        title: 'ATS AI Citizen Assistance',
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: const WelcomeScreen(),
      ),
    );
  }
}
