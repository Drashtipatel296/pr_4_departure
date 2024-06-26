import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_extend/share_extend.dart';

import '../../provider/data_provider.dart';
import '../../provider/fav_provider.dart';
import '../../provider/language_provider.dart';

class DetailScreen extends StatelessWidget {
  final int index;

  const DetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        title: const Text(
          'रहीम के दोहे',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<JsonDataProvider>(
          builder: (context, providerF, _) {
            if (providerF.data.isEmpty || index >= providerF.data.length) {
              return const Text('Data not available');
            }

            final data = providerF.data[index];
            final isFavorite = favProvider.isFavorite(data);

            String? translation;
            switch (languageProvider.selectedLanguage) {
              case 'english':
                translation = data.eng;
                break;
              case 'gujarati':
                translation = data.guj;
                break;
              case 'hindi':
              default:
                translation = data.hindi;
                break;
            }

            final shareContent = 'दोहा: ${data.shlok}\n\nअर्थ: $translation';

            return Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/img/detail.png'),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 120, left: 35, right: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'दोहा:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data.shlok.toString(),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'अर्थ:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      translation!,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            ShareExtend.share(shareContent, "text");
                          },
                          icon: const Icon(Icons.share, size: 30),
                        ),
                        IconButton(
                          onPressed: () {
                            favProvider.addToFavorites(data);
                          },
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            size: 30,
                            color: isFavorite ? Colors.red : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
