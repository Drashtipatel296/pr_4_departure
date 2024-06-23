import 'package:brahma_puran/provider/fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Consumer<FavProvider>(
          builder: (context, providerF, _) {
            if (providerF.favorites.isEmpty) {
              return const Text('No favorites added');
            }

            return ListView.builder(
              itemCount: providerF.favorites.length,
              itemBuilder: (context, index) {
                final favorite = providerF.favorites[index];
                return ListTile(
                  title: Text(
                    "दोहा: ${favorite.shlok}",
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'अर्थ: ${favorite.hindi}',
                    style: const TextStyle(fontSize: 15),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
