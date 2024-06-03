import 'package:flutter/material.dart';
import 'package:recipes_app/app/core/theme/app_text_theme_extension.dart';
import 'package:recipes_app/generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          S.of(context).start,
          style: Theme.of(context).xTextTheme.display0,
        ),
      ),
    );
  }
}
