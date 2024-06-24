import 'package:brahma_puran/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerFalse = Provider.of<LanguageProvider>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const ListTile(
              leading: Icon(Icons.person,size: 20,),
              title: Text('Account',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.change_circle),
              title: const Text('Theme',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              trailing: IconButton(
                  onPressed: () {
                    Provider.of<ThemeChangeProvider>(context, listen: false)
                        .toggleTheme();
              }, icon: Icon(Provider.of<ThemeChangeProvider>(context, listen: true).isDark ? Icons.dark_mode : Icons.light_mode)),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.language,size: 20,),
              title: const Text('Language',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              trailing: PopupMenuButton(
                icon: const Icon(Icons.translate),
                onSelected: (value) {
                  providerFalse.updateSelectedLanguage(value);
                },
                itemBuilder: (context) => [
                  const PopupMenuItem<String>(
                    value: 'hindi',
                    child: Text('Hindi'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'english',
                    child: Text('English'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'gujarati',
                    child: Text('Gujarati'),
                  ),
                ],
              ),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.ios_share,size: 20,),
              title: Text('Share App',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.privacy_tip_rounded,size: 20,),
              title: Text('Privacy and Security',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.star,size: 20,),
              title: Text('Rate us',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.policy,size: 20,),
              title: Text('Privacy Policy',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.not_interested,size: 20,),
              title: Text('Get Premium - No ads!',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
