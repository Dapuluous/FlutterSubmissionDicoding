import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:restaurantapps/db/db_helper.dart';
import 'package:restaurantapps/model/favorite.dart';
import 'package:restaurantapps/ui/detail/restaurant_detail_fav.dart';

class CardFavorite extends StatefulWidget {
  static const String favoriteTitle = 'Favorite List';
  static const routeName = '/resto_fav';

  @override
  _FavoriteCardState createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<CardFavorite> {
  DbHelper dbHelper = DbHelper();
  late List<Favorite> itemList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => updateListView());
    return Scaffold(
        appBar: AppBar(
            title: Text("Restoran Favorit"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
              itemCount: count,
              itemBuilder: (BuildContext context, int index) {
                final favorite = itemList[index];
                return Material(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Ink(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 2.0),
                          color: Colors.white30,
                        ),
                        child: ListTile(
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          leading: Hero(
                            tag: favorite.urlImage!,
                            child: Image.network(
                              'https://restaurant-api.dicoding.dev/images/small/' +
                                  favorite.urlImage!,
                              width: 100,
                            ),
                          ),
                          subtitle: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      favorite.name!,
                                      style: TextStyle(
                                          fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  children: [
                                    Text(favorite.city!),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  children: [
                                    Text(favorite.rating.toString()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          onTap: () => Navigator.pushNamed(
                            context,
                            RestaurantDetailFav.routeName,
                            arguments: favorite,
                          ),
                        ),
                      ),
                    ));
              }),
        ));
  }

  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Favorite>> itemListFuture = dbHelper.getFavoriteList();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }
}
