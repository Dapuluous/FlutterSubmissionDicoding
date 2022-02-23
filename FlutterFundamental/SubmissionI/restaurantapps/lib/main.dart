import 'dart:convert';

import 'package:flutter/material.dart';
import "package:flutter/services.dart" as root_bundle;
import 'package:restaurantapps/model/restaurant.dart';
import 'package:restaurantapps/detailrestaurant.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Restoran',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListRestoran(),
    );
  }
}

class ListRestoran extends StatefulWidget {
  const ListRestoran({Key? key}) : super(key: key);
  @override
  _ListRestoran createState() => _ListRestoran();
}

class _ListRestoran extends State<ListRestoran> {
  bool isSearching = false;
  String searchString = "";

  TextEditingController? textEditingController = TextEditingController();

  Future<List<Restaurant>> readJsonData() async {
    final jsondata = await root_bundle.rootBundle.loadString("assets/local_restaurant.json");
    final data = Restaurants.fromJson(
      json.decode(jsondata),
    );
    return data.restaurants;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !isSearching
            ? const Text('Aplikasi Restoran')
            : TextField(
          onChanged: (value) {
            setState(() {
              searchString = value.toLowerCase();
            });
          },
          style: const TextStyle(color: Colors.white),
          controller: textEditingController,
          decoration: const InputDecoration(
            hintText: "Cari Restoran Favoritmu",
            hintStyle: TextStyle(color: Colors.white),
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
        actions: <Widget>[
          !isSearching
              ? IconButton(
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
              });
            },
            icon: const Icon(Icons.search),
          )
              : TextButton(
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
              });
            },
            child: const Text(
              "Batal",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10, right: 10),
              child: Text(
                "Restaurant",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0, right:10, top: 5),
              child: Text(
                "Rekomendasi Restoran Khusus Untuk Anda",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            FutureBuilder(
              future: readJsonData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final restaurants = snapshot.data as List<Restaurant>;
                  return ListView.builder(
                    itemCount: restaurants.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return restaurants[index]
                          .name
                          .toLowerCase()
                          .contains(searchString)
                          ? InkWell(
                        splashColor: Colors.grey,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailRestaurant(
                                  restaurants: restaurants[index],
                                );
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          margin: const EdgeInsets.only(top: 5),
                          child: Card(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 150,
                                  height: 100,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                    ),
                                  ),
                                  child: Image.network(
                                      restaurants[index].pictureId,
                                      height: 100,
                                      fit:BoxFit.fill),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            restaurants[index].name,
                                            style: const TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          const Icon(
                                            Icons.location_on,
                                            color: Colors.grey,
                                            size: 20,
                                          ),
                                          Text(
                                            restaurants[index].city,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          const Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 20,
                                          ),
                                          Text(
                                            "${restaurants[index].rating}",
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ): Container();
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}