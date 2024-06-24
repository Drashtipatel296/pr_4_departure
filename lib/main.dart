import 'package:brahma_puran/provider/bottem_provider.dart';
import 'package:brahma_puran/provider/data_provider.dart';
import 'package:brahma_puran/provider/fav_provider.dart';
import 'package:brahma_puran/provider/language_provider.dart';
import 'package:brahma_puran/provider/share_provider.dart';
import 'package:brahma_puran/provider/theme_provider.dart';
import 'package:brahma_puran/screens/home/home_screen.dart';
import 'package:brahma_puran/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeChangeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavigationBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => JsonDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LanguageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShareProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavProvider(),
        ),
      ],
      child: const RahimKeDohe(),
    ),
  );
}

class RahimKeDohe extends StatelessWidget {
  const RahimKeDohe({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Provider.of<ThemeChangeProvider>(context).isDark
              ? ThemeData.dark()
              : ThemeData.light(),
          home: const SplashScreen(),
        );
      },
    );
  }
}
