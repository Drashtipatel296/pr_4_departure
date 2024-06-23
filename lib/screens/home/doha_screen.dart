import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../model/data_model.dart';
import '../../provider/data_provider.dart';
import '../detaile/detail_screen.dart';

class DohaScreen extends StatelessWidget {
  const DohaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    JsonDataProvider providerT = Provider.of<JsonDataProvider>(context, listen: true);
    JsonDataProvider providerF = Provider.of<JsonDataProvider>(context, listen: false);

    return Scaffold(
      body: FutureBuilder<String>(
        future: rootBundle.loadString('assets/jsondata/data.json'),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            List<dynamic> data = jsonDecode(snapshot.data!);
            providerF.convertData(data);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: providerT.data.length,
                itemBuilder: (context, index) {
                  DataModel item = providerT.data[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(index: index), // Pass the index you want to display
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/img/bg.png'),
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50,left: 50),
                            child: Text(item.shlok.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
