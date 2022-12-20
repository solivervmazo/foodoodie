import 'package:flutter/material.dart';
import 'package:foodoodie/config/routes/routes.dart';
import 'package:foodoodie/shared/theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodoodie',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      // home: const NewsFeedScreen(),
      getPages: Routes.routes(),
    );
  }
}
