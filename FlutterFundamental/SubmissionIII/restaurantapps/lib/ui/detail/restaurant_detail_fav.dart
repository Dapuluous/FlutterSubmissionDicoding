import 'package:flutter/material.dart';
import 'package:restaurantapps/model/favorite.dart';
import 'package:restaurantapps/db/db_helper.dart';
import 'package:restaurantapps/widget/bottom_navbar.dart';

class RestaurantDetailFav extends StatefulWidget {
  static const routeName = '/detail_favorite';
  final Favorite favorite;
  const RestaurantDetailFav({Key? key, required this.favorite});

  @override
  _favoriteFavState createState() => _favoriteFavState();
}

class _favoriteFavState extends State<RestaurantDetailFav> {
  DbHelper dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.favorite.name!}'s Detail"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.remove,
                color: Colors.white,
              ),
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Alert'),
                    content: const Text('Apakah anda ingin menghapus resto dari favorit?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Tidak'),
                        child: const Text('Tidak'),
                      ),
                      TextButton(
                        onPressed: () {
                          dbHelper.delete(widget.favorite.id!);
                          Navigator.of(context).pushNamedAndRemoveUntil(BottomNavbar.routeName, (Route<dynamic> route) => false);
                        },
                        child: const Text('Ya'),
                      ),
                    ],
                  ),
                );
                // dbHelper.delete(widget.favorite.id!);
              },
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                      'https://restaurant-api.dicoding.dev/images/medium/' +
                          widget.favorite.urlImage!),
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: <Widget>[
                              Text(widget.favorite.name!,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Row(
                                  children: <Widget>[
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20,
                                    ),
                                    Text(
                                      widget.favorite.rating.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: <Widget>[
                              const Icon(
                                Icons.location_on,
                                color: Colors.grey,
                                size: 20,
                              ),
                              Text(
                                "${widget.favorite.address}, ${widget.favorite.city}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: const Divider(
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text('Deskripsi: ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            widget.favorite.desc!,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}
