import 'package:flutter/material.dart';
import 'package:recipes_app/app/core/theme/app_colors.dart';
import 'package:recipes_app/app/core/theme/app_text_theme_extension.dart';
import 'package:recipes_app/features/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.deepPurple),
        useMaterial3: true,
        extensions: [
          AppTextThemeExtension.initialize(),
        ],
      ),
      home: const HomePage(),
    );
  }
}
