import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'html_editor_example_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final myBrightTheme = Theme.of(context).copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      primaryColor: Colors.black,
      textTheme: Theme.of(context).textTheme.copyWith(bodyText1: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: Platform.isIOS ? 17 : 14)),
    );
    final myDarkTheme = Theme.of(context).copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
      primaryColor: Colors.white,
      textTheme: Theme.of(context).textTheme.copyWith(bodyText1: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: Platform.isIOS ? 17 : 14)),
    );

    final app = PlatformApp(
      title: 'HTML Editor on iOS',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [LocaleNamesLocalizationsDelegate()],
      material: (_, __) => MaterialAppData(
        theme: myBrightTheme,
        darkTheme: myDarkTheme,
        themeMode: ThemeMode.system,
      ),
      home: HtmlEditorExample(title: 'HTML Editor on iOS'),
    );

    return Platform.isIOS
        ? Localizations(
            locale: const Locale('en', 'US'),
            delegates: <LocalizationsDelegate<dynamic>>[
              DefaultWidgetsLocalizations.delegate,
              DefaultMaterialLocalizations.delegate,
            ],
            child: app)
        : app;
  }
}
