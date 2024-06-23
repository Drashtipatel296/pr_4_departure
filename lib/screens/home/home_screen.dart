import 'package:brahma_puran/screens/favorite/favorite_screen.dart';
import 'package:brahma_puran/screens/home/doha_screen.dart';
import 'package:brahma_puran/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/bottem_provider.dart';

final List<Widget> _pages = [
  DohaScreen(),
  FavoriteScreen(),
  FlutterLogo(),
  SettingsScreen(),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        title: const Text(
          'रहीम के दोहे',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Consumer<BottomNavigationBarProvider>(
        builder: (context, provider, child) {
          return _pages[provider.currentIndex];
        },
      ),
      bottomNavigationBar: Consumer<BottomNavigationBarProvider>(
        builder: (context, provider, child) {
          return BottomNavigationBar(
            selectedItemColor: Colors.yellow.shade800,
            selectedFontSize: 18,
            showUnselectedLabels: true,
            unselectedFontSize: 15,
            unselectedItemColor: Colors.grey,
            currentIndex: provider.currentIndex,
            onTap: provider.setIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          );
        },
      ),
    );
  }
}
