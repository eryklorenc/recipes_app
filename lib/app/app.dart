import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:recipes_app/app/core/theme/app_colors.dart';
import 'package:recipes_app/app/core/theme/app_text_theme_extension.dart';
import 'package:recipes_app/features/home/ui/home_page.dart';
import 'package:recipes_app/generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white),
        useMaterial3: true,
        extensions: [
          AppTextThemeExtension.initialize(),
        ],
      ),
      home: const HomePage(),
    );
  }
}
