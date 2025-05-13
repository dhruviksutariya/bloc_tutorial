import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:MyHomePage()
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final local = AppLocalizations.of(context)!;

    // Pick font based on language
    TextStyle getFontStyle() {
      switch (locale) {
        case 'hi': // Hindi
          return GoogleFonts.hind(fontSize: 20, fontWeight: FontWeight.w500);
        case 'ar': // Arabic
          return GoogleFonts.tajawal(fontSize: 20, fontWeight: FontWeight.w500);
        case 'es': // Arabic
          return GoogleFonts.merienda(fontSize: 20, fontWeight: FontWeight.w500);
        default: // English or fallback
          return GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500);
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(local.email, style: getFontStyle())),
      body: Center(child: Text(local.localeName, style: getFontStyle())),
    );
  }
}
