import 'package:flutter/material.dart';

class FavoriteCard extends StatefulWidget {
  @override
  _FavoriteCardState createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Restoran Favorit")
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Coming Soon"),
        )
    );
  }
}
