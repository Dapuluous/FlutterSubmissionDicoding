import 'package:flutter/material.dart';
import 'package:fluttersubmission/model/resep_data.dart';

class DetailScreen extends StatelessWidget {
  final RecipeData recipe;
  DetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SafeArea(
                child: Stack(
                  children: <Widget>[
                    Image.asset(recipe.sampulGambar),
                    SafeArea(
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            Container(
              child: Text(
               recipe.namaResep,
                style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              padding: const EdgeInsets.only(left:10, right:10, top: 10),
            ),
            Container(
              child: Text(
                recipe.waktuJadi,
                style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey,
                ),
              ),
              padding: const EdgeInsets.only(left:10, right:10, top: 5),
            ),
            const Padding(
              padding: EdgeInsets.only(left:10, right:10, top: 5, bottom: 5),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Container(
                child: Text(
                  recipe.deskripsiPanjang,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 15.0),
                ),
                padding: const EdgeInsets.only(left:20, right:20),
            ),
          ],
        ),
      ),
    );
  }
}