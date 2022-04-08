import 'package:dl_moon_track/l10n/i118n.dart';
import 'package:dl_moon_track/src/providers/shared_preferences/shared_store.dart';
import 'package:dl_moon_track/src/ux/pages/moon_home.dart';
import 'package:dl_moon_track/src/ux/themes/theme_injection.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RM.storageInitializer(SharedStoreImpl());

  runApp(const MyApp());
}

class MyApp extends TopStatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: i18nRM.locale,
      localeResolutionCallback: i18nRM.localeResolutionCallback,
      localizationsDelegates: i18nRM.localizationsDelegates,
      title: "Krynn Moon Tracker",
      theme: themeRM.activeTheme(),
      home: const MoonHomePage(),
    );
  }
}
