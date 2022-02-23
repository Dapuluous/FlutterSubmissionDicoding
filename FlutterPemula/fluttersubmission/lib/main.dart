import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttersubmission/login.dart';
import 'package:fluttersubmission/model/resep_data.dart';
import 'package:fluttersubmission/recipe_detail.dart';

void main() {runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ResepKoeh',
      theme: ThemeData(),
      home: LoginState(),
    );
  }
}

class MainScreen extends StatelessWidget {
  final String username;
  const MainScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selamat Datang, $username'),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return const LoginState();
              }));
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final RecipeData recipe = recipeDataList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(recipe: recipe,);
              }));
            },
            child: Card(
              margin: const EdgeInsets.only(left:10.0, right: 10.0, top:10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                        recipe.sampulGambar,
                        height: 90,
                        width: 150,
                        fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            recipe.namaResep,
                            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                              recipe.deskripsiSingkat,
                              textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: recipeDataList.length,
      ),
    );
  }
}